#include <xc.h>
#include <stdio.h>
#include <plib.h>
#include "lc.h"
#include "lc-switch.h"
#include "pt_cornell_1_2_1.h"
#include "tft_master.h"
#include "tft_gfx.h"
#include "debouncer.h"
#include "ts_lcd.h"

#define LEFT_POS 20
#define RIGHT_POS 140

void tft_initGame(){
    tft_drawLine(120,60,120,320,ILI9341_WHITE);
}
void redrawCircle(int left_hard, int right_hard){

    if(left_display_frame >= 3) {
        tft_drawRect(short x, short y, short w, short h, unsigned short color);
        tft_fillRect(short x, short y, short w, short h, unsigned short color);
        tft_fillCircle(LEFT_POS, 300, BIGBALL_RADIUS, ILI9340_BLACK);
        tft_drawCircle(LEFT_POS, 300, left_ball_r, ILI9340_WHITE);
    } else {
        tft_fillCircle(LEFT_POS, 300, left_ball_r, ILI9340_YELLOW);
    }
    if(right_display_frame >= 3) {
        tft_fillCircle(RIGHT_POS, 300, BIGBALL_RADIUS, ILI9340_BLACK);
        tft_drawCircle(RIGHT_POS, 300, right_ball_r, ILI9340_WHITE);
    } else {
        tft_fillCircle(RIGHT_POS, 300, right_ball_r, ILI9340_YELLOW);
    }
}
void updatePos(int x, int y, int color, int hard) {
    int r = hard ? BIGBALL_RADIUS : BALL_RADIUS;
    tft_fillCircle(x, y, r, ILI9340_BLACK); //x, y, radius, color
    switch (color) {
        case 0: tft_fillCircle(x, y + FALL_SPEED, r, ILI9340_RED); break;
        case 1: tft_fillCircle(x, y + FALL_SPEED, r, ILI9340_GREEN); break;
    }
   
}
void printLine(int line_number, char* print_buffer, short text_color, short back_color){
    // line number 0 to 31
    /// !!! assumes tft_setRotation(0);
    // print_buffer is the string to print
    int v_pos;
    v_pos = line_number * 10 ;
    // erase the pixels
    tft_fillRoundRect(0, v_pos, 239, 8, 1, back_color);// x,y,w,h,radius,color
    tft_setTextColor(text_color);
    tft_setCursor(0, v_pos);
    tft_setTextSize(1);
    tft_writeString(print_buffer);
}


static struct pt pt_drum, pt_display, pt_guitar, pt_adc, pt_main_menu, pt_score_menu, pt_difficulty_menu, pt_song_menu;
static PT_THREAD (protothread_display(struct pt *pt)) {
    PT_BEGIN(pt);
    while(1) {
        if(menu_state != PLAY) {
            PT_YIELD_TIME_msec(60);
            continue;
        }
        tft_initGame();
        int i;
        int left_min_dis, right_min_dis;
        int left_min_id, right_min_id;
        left_min_dis = 10000;
        right_min_dis = 10000;
        left_min_id = -1;
        right_min_id = -1;
        for(i = 0; i < cur_ballsize; i++) {
           // if(balls[i].y < 0) balls[i].appear = 0;
            if(balls[i].appear == 1) {
                updatePos(balls[i].x, balls[i].y, balls[i].color, balls[i].hard);                
                balls[i].y += FALL_SPEED;  
                if(balls[i].x == LEFT_POS) {
                    int left_dis = abs(balls[i].y - 300);
                    if(left_dis <= left_min_dis) {
                        left_min_dis = left_dis;
                        left_min_id = i;
                    }
                       
                }                    
                else if(balls[i].x == RIGHT_POS) {
                    int right_dis = abs(balls[i].y - 300);
                    if(right_dis <= right_min_dis) {
                        right_min_dis = right_dis ;
                        right_min_id = i;
                    }
                   
                }
                int r = balls[i].hard ? BIGBALL_RADIUS : BALL_RADIUS;
                if(balls[i].y <= 0) {
                    tft_fillCircle(balls[i].x, balls[i].y, r, ILI9340_BLACK);
                    balls[i].appear = 0;
                }
            }                
        }
        int left_hard = left_min_id == -1 ? 0 : balls[left_min_id].hard;
        int right_hard = right_min_id == -1 ? 0 : balls[right_min_id].hard;
        redrawCircle(left_hard, right_hard);
        if(left_beat.used == 0) {
            left_display_frame = 0;
            int r = left_hard ? BIGBALL_RADIUS : BALL_RADIUS;
            tft_fillCircle(LEFT_POS, 300, r, ILI9340_YELLOW);
            left_beat.used = 1;
            if(left_min_id != -1){
                if(left_min_dis <= (2 * r + 5) && left_hard == (left_beat.beat - 1)) {                    
                    score++;
                }                    
            }
        } else {
            left_display_frame = left_display_frame >= 3 ? 3 : left_display_frame + 1;
        }
       
        if(right_beat.used == 0) {
            right_display_frame = 0;
            int r = right_hard ? BIGBALL_RADIUS : BALL_RADIUS;
            tft_fillCircle(RIGHT_POS, 300, r, ILI9340_YELLOW);
            right_beat.used = 1;
            if(right_min_id != -1){
                if(right_min_dis <= (2 * r + 5)&& right_hard == (right_beat.beat - 1)) {                    
                    score++;
                }                    
            }
        } else {
            right_display_frame = right_display_frame >= 3 ? 3 : right_display_frame + 1;
        }
       
//        if(left_beat.beat == SOFT_BEAT)
//            sprintf(buffer,"left:soft:%d left_dis: %d score:%d", left_beat.beat, left_min_dis, score);
//        else if(left_beat.beat == HARD_BEAT)
//            sprintf(buffer,"left:hard:%d left_dis: %d score:%d",left_beat.beat, left_min_dis, score);
       
        tft_fillRect(145, 25, 60, 30, ILI9340_BLACK);
        tft_setCursor(80, 30);
        tft_setTextColor(ILI9340_WHITE);
        tft_setTextSize(2);
        sprintf(buffer,"Score: %d", score);
        tft_writeString(buffer);
       
        PT_YIELD_TIME_msec(15);
    }
    PT_END(pt);
}
static PT_THREAD (protothread_drum(struct pt *pt)) {
    PT_BEGIN(pt);
    static Ball temp;
    while(1) {                  
        if(menu_state != PLAY) {
            PT_YIELD_TIME_msec(60);
            continue;
        }
        if(drum_index >= current_song->drum_len) {
            menu_state = SCORE;
            tft_fillScreen(ILI9340_BLACK);
            current_song->latest_score = score;
            current_song->highest_score = score > current_song->highest_score ?
                score : current_song->highest_score;
            continue;
        }
        if(current_song->drum_time[drum_index] != 0)
            PT_YIELD_TIME_msec(current_song->drum_time[drum_index]);
        if(current_song->drum_time[drum_index] < 300) {            
            drum_side = drum_side ? LEFT : RIGHT;            
        }
        //if()
        temp.x = drum_side ? RIGHT_POS : LEFT_POS;
        temp.y =  70;
        temp.appear = rand() % 1000 <= difficulty ? 1 : 0;
        temp.color = drum_side ? 1 : 0;
        temp.hard  = rand() % 1000 <= 200 ? 1 : 0;
           
        balls[drum_index % BALL_SIZE] = temp;
        cur_ballsize = cur_ballsize >= BALL_SIZE ? BALL_SIZE : cur_ballsize + 1;
       
        drum_index++;      
    }
    PT_END(pt);
}
static PT_THREAD (protothread_guitar(struct pt *pt)) {
    PT_BEGIN(pt);
    static Ball temp;
    while(1) {              
        if(menu_state != PLAY) {
            PT_YIELD_TIME_msec(60);
            continue;
        }
        if(guitar_index >= current_song->guitar_len) {
            guitar_index = current_song->guitar_len;
            menu_state = SCORE;
            tft_fillScreen(ILI9340_BLACK);
            current_song->latest_score = score;
            current_song->highest_score = score > current_song->highest_score ?
                score : current_song->highest_score;
            continue;
        }
        int sleep_time = current_song->guitar_time[guitar_index] ;//>= 500 ?
        //    current_song->guitar_time[guitar_index] : 500;
       // if(current_song->guitar_time[guitar_index] >= 500)
            PT_YIELD_TIME_msec(sleep_time);
        note_time = 0;
        current_amplitude = 0;
        FM_current_amplitude = 0;
        int freq = Fouts[current_song->guitar[guitar_index]];
        DDS_increment = freq * two32/Fs;
        FM_DDS_increment = 3 * freq * two32/Fs ;
               
        guitar_index++;
       
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
       // sprintf(buffer,"left:%d    right:%d", left_beat.beat, right_beat.beat);
        printLine(0, buffer, ILI9340_WHITE, ILI9340_BLACK);
       // tft_fillScreen(ILI9340_BLACK);
        /*1. draw UI
          2. track the cursor */
        if(left_beat.used == 0 && left_beat.beat == SOFT_BEAT) {
            menu_cursor = (menu_cursor + 1) % 4;
        }
        else if(right_beat.used == 0 && right_beat.beat == SOFT_BEAT) {
            menu_cursor = menu_cursor == 0 ? 3 : menu_cursor - 1;
        }
        int pressed = (left_beat.used == 0 && left_beat.beat == HARD_BEAT) ||
        (right_beat.used == 0 && right_beat.beat == HARD_BEAT);
        left_beat.used = 1;
        right_beat.used = 1;
        switch (menu_cursor) {
            case 0:
                tft_setCursor(100, 100);
                tft_setTextColor(ILI9340_RED);
                tft_writeString("Start Game");
               
                tft_setCursor(100, 120);            
                tft_setTextColor(ILI9340_WHITE);                              
                tft_writeString("Choose Songs");
               
                tft_setCursor(100, 140);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Difficulty Setting");
               
                tft_setCursor(100, 160);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Score");
                if(pressed) {
                    menu_state = PLAY;
                    guitar_index = 0;
                    drum_index = 0;
                    cur_ballsize = 0;
                    score = 0;
                    tft_fillScreen(ILI9340_BLACK);
                }
                   
                   
                break;
            case 1:
                tft_setCursor(100, 100);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Start Game");
               
                tft_setCursor(100, 120);            
                tft_setTextColor(ILI9340_RED);                              
                tft_writeString("Choose Songs");
               
                tft_setCursor(100, 140);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Difficulty Setting");
               
                tft_setCursor(100, 160);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Score");
                if(pressed) {
                    menu_state = SONGSELECTION;
                    tft_fillScreen(ILI9340_BLACK);
                    menu_cursor = 0;
                }
                   
                break;
               
            case 2:
                tft_setCursor(100, 100);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Start Game");
               
                tft_setCursor(100, 120);            
                tft_setTextColor(ILI9340_WHITE);                              
                tft_writeString("Choose Songs");
               
                tft_setCursor(100, 140);
                tft_setTextColor(ILI9340_RED);
                tft_writeString("Difficulty Setting");
               
                tft_setCursor(100, 160);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Score");
                if(pressed) {
                    menu_state = DIFFICULTY;
                    tft_fillScreen(ILI9340_BLACK);
                    menu_cursor = 0;
                }              
                break;    
            case 3:
                tft_setCursor(100, 100);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Start Game");
               
                tft_setCursor(100, 120);            
                tft_setTextColor(ILI9340_WHITE);                              
                tft_writeString("Choose Songs");
               
                tft_setCursor(100, 140);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Difficulty Setting");
               
                tft_setCursor(100, 160);
                tft_setTextColor(ILI9340_RED);
                tft_writeString("Score");
                if(pressed) {
                    menu_state = SCORE;
                    tft_fillScreen(ILI9340_BLACK);
                }
                   
                break;  
        }
       
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
        //sprintf(buffer,"left:%d    right:%d", left_beat.beat, right_beat.beat);
        printLine(0, buffer, ILI9340_WHITE, ILI9340_BLACK);
       // tft_fillScreen(ILI9340_BLACK);
        /*1. draw UI
          2. track the cursor */
        int pressed = (left_beat.used == 0 && left_beat.beat == HARD_BEAT) ||
        (right_beat.used == 0 && right_beat.beat == HARD_BEAT);
        left_beat.used = 1;
        right_beat.used = 1;
       
        if(pressed) {
            tft_fillScreen(ILI9340_BLACK);
            menu_state = MAIN_MENU;
            continue;
        }
        tft_setCursor(25, 100);
        tft_setTextColor(ILI9340_WHITE);
        tft_writeString("Song Name");      
        tft_setCursor(125, 100);
        tft_setTextColor(ILI9340_WHITE);
        tft_writeString("Highest");        
        tft_setCursor(175, 100);
        tft_setTextColor(ILI9340_WHITE);
        tft_writeString("Latest");
       
        tft_setCursor(25, 140);
        tft_setTextColor(ILI9340_WHITE);
        sprintf(score_buffer,"%s", song_1.name);
        tft_writeString(score_buffer);      
        tft_setCursor(125, 140);
        tft_setTextColor(ILI9340_WHITE);
        sprintf(score_buffer,"%d", song_1.highest_score);
        tft_writeString(score_buffer);        
        tft_setCursor(175, 140);
        tft_setTextColor(ILI9340_WHITE);
        sprintf(score_buffer,"%d", song_1.latest_score);
        tft_writeString(score_buffer);  
       
        tft_setCursor(25, 160);
        tft_setTextColor(ILI9340_WHITE);
        sprintf(score_buffer,"%s", song_2.name);
        tft_writeString(score_buffer);      
        tft_setCursor(125, 160);
        tft_setTextColor(ILI9340_WHITE);
        sprintf(score_buffer,"%d", song_2.highest_score);
        tft_writeString(score_buffer);        
        tft_setCursor(175, 160);
        tft_setTextColor(ILI9340_WHITE);
        sprintf(score_buffer,"%d", song_2.latest_score);
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
        sprintf(buffer,"");
        printLine(0, buffer, ILI9340_WHITE, ILI9340_BLACK);
       
        if(left_beat.used == 0 && left_beat.beat == SOFT_BEAT) {
            menu_cursor = (menu_cursor + 1) % 3;
        }
        else if(right_beat.used == 0 && right_beat.beat == SOFT_BEAT) {
            menu_cursor = menu_cursor == 0 ? 2 : menu_cursor - 1;
        }
        /*1. draw UI
          2. track the cursor */
        int pressed = (left_beat.used == 0 && left_beat.beat == HARD_BEAT) ||
        (right_beat.used == 0 && right_beat.beat == HARD_BEAT);
        left_beat.used = 1;
        right_beat.used = 1;
       
        switch (menu_cursor) {
            case 0:
                tft_setCursor(100, 100);
                tft_setTextColor(ILI9340_RED);
                tft_writeString("Easy");
               
                tft_setCursor(100, 120);            
                tft_setTextColor(ILI9340_WHITE);                              
                tft_writeString("Medium");
               
                tft_setCursor(100, 140);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Hard");
               
                if(pressed) {
                    menu_state = MAIN_MENU;
                    difficulty = DIFFICULTY_EASY;
                    menu_cursor = 2;
                    tft_fillScreen(ILI9340_BLACK);
                }
                   
                   
                break;
            case 1:
                tft_setCursor(100, 100);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Easy");
               
                tft_setCursor(100, 120);            
                tft_setTextColor(ILI9340_RED);                              
                tft_writeString("Medium");
               
                tft_setCursor(100, 140);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Hard");
                if(pressed) {
                    menu_state = MAIN_MENU;
                    difficulty = DIFFICULTY_MEDIUM;
                    menu_cursor = 2;
                    tft_fillScreen(ILI9340_BLACK);
                }
                break;
               
            case 2:
                tft_setCursor(100, 100);
                tft_setTextColor(ILI9340_WHITE);
                tft_writeString("Easy");
               
                tft_setCursor(100, 120);            
                tft_setTextColor(ILI9340_WHITE);                              
                tft_writeString("Medium");
               
                tft_setCursor(100, 140);
                tft_setTextColor(ILI9340_RED);
                tft_writeString("Hard");
                if(pressed) {
                    menu_state = MAIN_MENU;
                    difficulty = DIFFICULTY_HARD;
                    menu_cursor = 2;
                    tft_fillScreen(ILI9340_BLACK);
                }
                break;  
         
        PT_YIELD_TIME_msec(30);
    }
    PT_END(pt);
}
}

