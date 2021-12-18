#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <plib.h>
#include <stdint.h>
#include <stdfix.h>
#include <math.h>


#include "config.h"
#include "pt_cornell_1_2_1.h"
#include "tft_master.h"
#include "tft_gfx.h"
#include "debouncer.h"
#include "ts_lcd.h"

#include "notes.h"
#include "songs.h"

#include "dds.h"
#include "midi_music.h"

#define LEFT_POS 20
#define RIGHT_POS 140

#define BLEFT_POS 10
#define BRIGHT_POS 130

#define WIDTH 79
#define HEIGHT 42

#define BWIDTH 99
#define BHEIGHT 52

#define B_SIZE 50

#define MAIN_MENU 0
#define PLAY 1
#define SONGSELECTION 2
#define DIFFICULTY 3
#define SCORE 4

#define DIFFICULTY_EASY 300
#define DIFFICULTY_NORMAL 500
#define DIFFICULTY_HARD 800

#define two32 4294967296.0 // 2^32 //constant for setting DDS frequency
#define Fs 44000.0 // audio sample frequency

uint32_t note_numA, note_numB;

struct music *current_song;

uint8_t menu_state;

uint8_t score;
uint8_t score_ary[10];

uint8_t drum_side;

uint8_t left_display_frame, right_display_frame;

uint8_t menu_state;

uint8_t cur_Bsize = 0;

char buffer[60];
char score_buffer[60];

typedef struct block{
    int x;
    int y;
    int appear;
    int color;
}Block;

Block blocks[B_SIZE];
uint16_t block_index;

uint8_t left_hit, right_hit;

uint16_t difficulty;
uint8_t FALL_SPEED;

// touch screen feedback
uint16_t x, y; 
uint8_t pressed;

void redrawRect(){

    if(left_display_frame >= 3) {
        tft_fillRect(BLEFT_POS, 239, BWIDTH, BHEIGHT, ILI9341_BLACK);
        tft_drawRect(LEFT_POS, 239, WIDTH, HEIGHT, ILI9341_WHITE);
    } else {
        tft_fillRect(LEFT_POS, 239, WIDTH, HEIGHT, ILI9341_YELLOW);
    }
    if(right_display_frame >= 3) {
        tft_fillRect(BRIGHT_POS, 239, BWIDTH, BHEIGHT, ILI9341_BLACK);
        tft_drawRect(RIGHT_POS, 239, WIDTH, HEIGHT, ILI9341_WHITE);
    } else {
        tft_fillRect(RIGHT_POS, 239, WIDTH, HEIGHT, ILI9341_YELLOW);
    }
}

void updatePos(int x, int y, int color) {
    tft_fillRect(x, y, WIDTH, HEIGHT, ILI9341_BLACK);
    switch(color) {
        case 0: tft_fillRect(x, y + FALL_SPEED, WIDTH, HEIGHT, ILI9341_RED); break;
        case 1: tft_fillRect(x, y + FALL_SPEED, WIDTH, HEIGHT, ILI9341_GREEN); break;
    }
   
}

//ISR for touch screen input
void __ISR(_TIMER_3_VECTOR, ipl2) Timer3(void){
        mT3ClearIntFlag();
        pressed = ts_lcd_get_ts(&x, &y);
        
        if (pressed == 1){
            if (x >= LEFT_POS && x <= (LEFT_POS + WIDTH)){
                left_hit = 1;
            } else {
                left_hit = 0;
            }
            
            if (x >= LEFT_POS && y <= (RIGHT_POS+WIDTH)){
                right_hit = 1;
            } else {
                right_hit = 0;
            }
        } else {
            left_hit = 0;
            right_hit = 0;
        }
}

//Protothread structure
static struct pt pt_block, pt_display, pt_main_menu, pt_score_menu, pt_difficulty_menu, pt_track1, pt_track2, pt_song_menu;

static PT_THREAD (protothread_track1(struct pt *pt)) {
    PT_BEGIN(pt);
    
    uint32_t freq;
    
    while(1) {              
        if(menu_state != PLAY) {
            PT_YIELD_TIME_msec(60);
            continue;
        }

        uint16_t sleep_time = (*current_song->track1_dur)[note_numA]*(current_song->base_dur);

        PT_YIELD_TIME_msec(sleep_time);
        
        
        freq = (uint32_t) ((*current_song->track1_note)[note_numA]);
        //freq = (uint32_t) (440*pow(2,((Astley_note4[note_num]-68)/12)));
        
        

        DDS_incrementA = freq * two32/Fs;

        note_numA++;
        if(note_numA == current_song->track1_len-1){
            note_numA = 0;
        }
    }
    PT_END(pt);
}

static PT_THREAD (protothread_track2(struct pt *pt)) {
    PT_BEGIN(pt);
    
    uint32_t freq;
    
    while(1) {              
        if(menu_state != PLAY) {
            PT_YIELD_TIME_msec(60);
            continue;
        }

        uint16_t sleep_time = (*current_song->track2_dur)[note_numB]*(current_song->base_dur);

        PT_YIELD_TIME_msec(sleep_time);
        
        
        freq = (uint32_t) ((*current_song->track2_note)[note_numB]);
        //freq = (uint32_t) (440*pow(2,((Astley_note4[note_num]-68)/12))

        DDS_incrementB = freq * two32/Fs;

        note_numB++;
        if(note_numB == current_song->track2_len-1){
            note_numB = 0;
        }
    }
    PT_END(pt);
}


static PT_THREAD (protothread_display(struct pt *pt)) {
    PT_BEGIN(pt);
    while(1) {
        if(menu_state != PLAY) {
            PT_YIELD_TIME_msec(60);
            continue;
        }
        tft_drawLine(120,60,120,320,ILI9341_WHITE);
        int i;
        int left_min_dis, right_min_dis;
        int left_min_id, right_min_id;
        left_min_dis = 10000;
        right_min_dis = 10000;
        left_min_id = -1;
        right_min_id = -1;
        for(i = 0; i < cur_Bsize; i++) {
            if(blocks[i].appear == 1) {
                updatePos(blocks[i].x, blocks[i].y, blocks[i].color);                
                blocks[i].y += FALL_SPEED;  
                if(blocks[i].x == LEFT_POS) {
                    int left_dis = abs(239 - blocks[i].y);
                    if(left_dis <= left_min_dis) {
                        left_min_dis = left_dis;
                        left_min_id = i;
                    }
                       
                }                    
                else if(blocks[i].x == RIGHT_POS) {
                    int right_dis = abs(239 - blocks[i].y);
                    if(right_dis <= right_min_dis) {
                        right_min_dis = right_dis ;
                        right_min_id = i;
                    }
                   
                }
                if(blocks[i].y >= 319) {
                    tft_fillRect(blocks[i].x, blocks[i].y, WIDTH, HEIGHT, ILI9341_BLACK);
                    blocks[i].appear = 0;
                }
            }                
        }
        redrawRect();
        if(left_hit == 1) {
            left_display_frame = 0;
            tft_fillRect(LEFT_POS, 239, WIDTH, HEIGHT, ILI9341_WHITE);
            if(left_min_id != -1){
                if(left_min_dis <= 10) {                    
                    score++;
                }                    
            }
        } else {
            left_display_frame = (left_display_frame >= 3) ? 3 : left_display_frame + 1;
        }
       
        if(right_hit == 1) {
            right_display_frame = 0;
            tft_fillRect(RIGHT_POS, 239, WIDTH, HEIGHT, ILI9341_WHITE);
            if(right_min_id != -1){
                if(right_min_dis <= 10) {                    
                    score++;
                }                    
            }
        } else {
            right_display_frame = (right_display_frame >= 3) ? 3 : right_display_frame + 1;
        }

        tft_setCursor(130, 299);
        tft_setTextColor(ILI9341_BLACK);
        tft_writeString(buffer);
        
        tft_setCursor(130, 299);
        tft_setTextColor(ILI9341_WHITE);
        tft_setTextSize(2);
        sprintf(buffer,"Score:%d", score);
        tft_writeString(buffer);
        
        //test
        /*
        tft_setTextSize(2);
        //erase old text
        tft_setTextColor(ILI9341_BLACK);
        tft_writeString(buffer);
        tft_fillRect(0, 10, 239, 20, ILI9341_BLACK);
        
        tft_setCursor(0, 10);
        tft_setTextColor(ILI9341_WHITE);
        //sprintf(buffer,"x: %d, y: %d, z: %d", p.x, p.y, p.z);
        sprintf(buffer,"x: %d, y: %d, z: %d", x, y, pressed);
        tft_writeString(buffer);
        */
        
        PT_YIELD_TIME_msec(15);
    }
    PT_END(pt);
}
static PT_THREAD (protothread_block(struct pt *pt)) {
    PT_BEGIN(pt);
    static Block Bbuffer;
    while(1) {                  
        if(menu_state != PLAY) {
            PT_YIELD_TIME_msec(60);
            continue;
        }
             
        PT_YIELD_TIME_msec(200);
        drum_side = rand() & 0x01;            

        Bbuffer.x = drum_side ? RIGHT_POS : LEFT_POS;
        Bbuffer.y =  0;
        Bbuffer.appear = rand() % 1000 <= difficulty ? 1 : 0;
        Bbuffer.color = drum_side ? 1 : 0;
           
        blocks[block_index] = Bbuffer;
        cur_Bsize = (cur_Bsize >= B_SIZE) ? B_SIZE : cur_Bsize + 1;
        block_index++;
        
        if (cur_Bsize>=B_SIZE){
            PT_YIELD_TIME_msec(10000);
            menu_state = MAIN_MENU;
            tft_fillScreen(ILI9341_BLACK);
            current_song->latest_score = score;
            current_song->highest_score = score > current_song->highest_score ? score : current_song->highest_score;
            continue;
        }
        
    }
    PT_END(pt);
}

static PT_THREAD (protothread_main_menu(struct pt *pt)) {
    PT_BEGIN(pt);
    while(1) {
        if(menu_state != MAIN_MENU) {
            PT_YIELD_TIME_msec(60);
            continue;
        }
        
        tft_setTextSize(1);
        tft_setCursor(100, 100);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Start Game");
               
        tft_setCursor(100, 150);            
        tft_setTextColor(ILI9341_WHITE);                              
        tft_writeString("Choose Songs");
               
        tft_setCursor(100, 200);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Difficulty Setting");
               
        tft_setCursor(100, 250);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Score");
                
        if (pressed == 1 && x>=80 && x<=140 && y>=80 && y<= 120){
            
            tft_setCursor(100, 100);
            tft_setTextColor(ILI9341_RED);
            tft_writeString("Start Game");
            
            menu_state = PLAY;
            block_index = 0;
            cur_Bsize = 0;
            score = 0;
            tft_fillScreen(ILI9341_BLACK);
        } else if  (pressed == 1 && x>=80 && x<=140 && y>=130 && y<= 170){
            
            tft_setCursor(100, 150);            
            tft_setTextColor(ILI9341_RED);                              
            tft_writeString("Choose Songs");
            
            menu_state = SONGSELECTION;
            tft_fillScreen(ILI9341_BLACK);
        } else if  (pressed == 1 && x>=80 && x<=140 && y>=180 && y<= 220){
            
            tft_setCursor(100, 200);
            tft_setTextColor(ILI9341_RED);
            tft_writeString("Difficulty Setting");
            
            menu_state = DIFFICULTY;
            tft_fillScreen(ILI9341_BLACK);
        } else if  (pressed == 1 && x>=80 && x<=140 && y>=230 && y<= 270){
            
            tft_setCursor(100, 250);
            tft_setTextColor(ILI9341_RED);
            tft_writeString("Score");
            
            menu_state = SCORE;
            tft_fillScreen(ILI9341_BLACK);
        }
        
        /*
        //touch screen test
        tft_setCursor(0, 10);
        tft_setTextColor(ILI9341_WHITE); 
        tft_setTextSize(2);
        //erase old text
        tft_setTextColor(ILI9341_BLACK);
        tft_writeString(buffer);
        
        tft_setCursor(0, 10);
        tft_setTextColor(ILI9341_WHITE);
        //sprintf(buffer,"x: %d, y: %d, z: %d", p.x, p.y, p.z);
        sprintf(buffer,"x: %d, y: %d, z: %d", x, y, pressed);
        tft_writeString(buffer);
       */
        
        PT_YIELD_TIME_msec(30);
    }
    PT_END(pt);
}

static PT_THREAD (protothread_score_menu(struct pt *pt)) {
    PT_BEGIN(pt);
    while(1) {
        if(menu_state != SCORE) {
            PT_YIELD_TIME_msec(60);
            continue;
        }
        
        if(pressed) {
            tft_fillScreen(ILI9341_BLACK);
            menu_state = MAIN_MENU;
            continue;
        }
        tft_setCursor(25, 100);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Song Name");      
        tft_setCursor(125, 100);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Highest");        
        tft_setCursor(175, 100);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Latest");

       

        tft_setCursor(25, 140);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Mario");       
        tft_setCursor(125, 140);
        tft_setTextColor(ILI9341_WHITE);
        sprintf(score_buffer,"%d", mario.highest_score);
        tft_writeString(score_buffer);        
        tft_setCursor(175, 140);
        tft_setTextColor(ILI9341_WHITE);
        sprintf(score_buffer,"%d", mario.latest_score);
        tft_writeString(score_buffer);  

       

        tft_setCursor(25, 160);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Twinkle");      
        tft_setCursor(125, 160);
        tft_setTextColor(ILI9341_WHITE);
        sprintf(score_buffer,"%d", twinkle.highest_score);
        tft_writeString(score_buffer);        
        tft_setCursor(175, 160);
        tft_setTextColor(ILI9341_WHITE);
        sprintf(score_buffer,"%d", twinkle.latest_score);
        tft_writeString(score_buffer);  
        
        tft_setCursor(25, 180);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Amazing");      
        tft_setCursor(125, 180);
        tft_setTextColor(ILI9341_WHITE);
        sprintf(score_buffer,"%d", amazing.highest_score);
        tft_writeString(score_buffer);        
        tft_setCursor(175, 180);
        tft_setTextColor(ILI9341_WHITE);
        sprintf(score_buffer,"%d", amazing.latest_score);
        tft_writeString(score_buffer);  


        PT_YIELD_TIME_msec(30);
    }
    PT_END(pt);
}
static PT_THREAD (protothread_difficulty_menu(struct pt *pt)) {
    PT_BEGIN(pt);
    while(1) {
        if(menu_state != DIFFICULTY) {
            PT_YIELD_TIME_msec(60);
            continue;
        }
          
        tft_setCursor(100, 100);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Easy");
               
        tft_setCursor(100, 150);            
        tft_setTextColor(ILI9341_WHITE);                              
        tft_writeString("Medium");
               
        tft_setCursor(100, 200);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Hard");
               
                
        if (pressed == 1 && x>=80 && x<=140 && y>=80 && y<= 120){
            
            tft_setCursor(100, 100);
            tft_setTextColor(ILI9341_RED);
            tft_writeString("Easy");
            
            menu_state = MAIN_MENU;
            difficulty = DIFFICULTY_EASY;
            FALL_SPEED = 5;
            tft_fillScreen(ILI9341_BLACK);
        } else if  (pressed == 1 && x>=80 && x<=140 && y>=130 && y<= 170){
            
            tft_setCursor(100, 150);            
            tft_setTextColor(ILI9341_RED);                              
            tft_writeString("Medium");
            
            menu_state = MAIN_MENU;
            difficulty = DIFFICULTY_NORMAL;
            FALL_SPEED = 10;
            tft_fillScreen(ILI9341_BLACK);
        } else if  (pressed == 1 && x>=80 && x<=140 && y>=180 && y<= 220){
            
            tft_setCursor(100, 200);
            tft_setTextColor(ILI9341_RED);
            tft_writeString("Hard");
            
            menu_state = MAIN_MENU;
            difficulty = DIFFICULTY_HARD;
            FALL_SPEED = 20;
            tft_fillScreen(ILI9341_BLACK);
        }
        
        PT_YIELD_TIME_msec(30);
    }
    PT_END(pt);
}

static PT_THREAD (protothread_song_menu(struct pt *pt)) {

    PT_BEGIN(pt);

    while(1) {
        if(menu_state != SONGSELECTION) {
            PT_YIELD_TIME_msec(60);
            continue;
        }
       
        tft_setCursor(100, 100);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Twinkle");
               
        tft_setCursor(100, 150);            
        tft_setTextColor(ILI9341_WHITE);                              
        tft_writeString("Mario");
               
        tft_setCursor(100, 200);
        tft_setTextColor(ILI9341_WHITE);
        tft_writeString("Amazing");
               
                
        if (pressed == 1 && x>=80 && x<=140 && y>=80 && y<= 120){
            
            tft_setCursor(100, 100);
            tft_setTextColor(ILI9341_RED);
            tft_writeString("Twinkle");
            current_song = &twinkle;
            menu_state = MAIN_MENU;
            tft_fillScreen(ILI9341_BLACK);
        } else if  (pressed == 1 && x>=80 && x<=140 && y>=130 && y<= 170){
            
            tft_setCursor(100, 150);            
            tft_setTextColor(ILI9341_RED);                              
            tft_writeString("Mario");
            current_song = &mario;
            menu_state = MAIN_MENU;
            tft_fillScreen(ILI9341_BLACK);
        } else if  (pressed == 1 && x>=80 && x<=140 && y>=180 && y<= 220){
            
            tft_setCursor(100, 200);
            tft_setTextColor(ILI9341_RED);
            tft_writeString("Amazing");
            current_song = &amazing;
            menu_state = MAIN_MENU;
            tft_fillScreen(ILI9341_BLACK);
        }
                break;
        PT_YIELD_TIME_msec(30);
    }
    PT_END(pt);
}

void main(void) {

    SYSTEMConfigPerformance(sys_clock);
    INTEnableSystemMultiVectoredInt();
    mPORTASetPinsDigitalOut(BIT_0);  // this was in Tahmid's example; not sure why
    
    // Turn off analog function of Ports A and B
    ANSELA = 0;
    ANSELB = 0;

    // Turn off comparator functions
    CM1CON = 0;
    CM2CON = 0;
    
    dds_init();
    INTEnableSystemMultiVectoredInt();
    dds_on(sys_clock/Fs-1);
    
    musicInit();
    current_song = &twinkle;
    
    //set up timer3
    OpenTimer3(T3_ON | T3_SOURCE_INT | T3_PS_1_1, 4000);
    ConfigIntTimer3(T3_INT_ON | T3_INT_PRIOR_2);
    mT3ClearIntFlag();
    
    tft_begin();
    configureADC();
    // init the display

   
    tft_init_hw();
    tft_fillScreen(ILI9341_BLACK);

    score = 0;

    tft_setRotation(0); // Use tft_setRotation(1) for 320x240

    block_index=0;

    // === config threads ==========
    // turns OFF UART support and debugger pin, unless defines are set
    PT_setup();
    // init the threads
    PT_INIT(&pt_block);
    PT_INIT(&pt_display);
    PT_INIT(&pt_main_menu);
    PT_INIT(&pt_score_menu);
    PT_INIT(&pt_difficulty_menu);
    PT_INIT(&pt_track1);
    PT_INIT(&pt_track2);
    PT_INIT(&pt_song_menu);
    
    menu_state = MAIN_MENU;

    left_hit = 0;

    right_hit = 0;
    
    DDS_phaseA = 0;
    DDS_phaseB = 0;
    
    note_numA = 0;
    note_numB = 0;

    difficulty = DIFFICULTY_NORMAL;
    
    FALL_SPEED = 10;

    while (1){
        PT_SCHEDULE(protothread_track1(&pt_track1));
        PT_SCHEDULE(protothread_track2(&pt_track2));
        PT_SCHEDULE(protothread_block(&pt_block));
        PT_SCHEDULE(protothread_display(&pt_display));
        PT_SCHEDULE(protothread_main_menu(&pt_main_menu));    
        PT_SCHEDULE(protothread_score_menu(&pt_score_menu));
        PT_SCHEDULE(protothread_difficulty_menu(&pt_difficulty_menu)); 
        PT_SCHEDULE(protothread_song_menu(&pt_song_menu));
      }
  } // main
