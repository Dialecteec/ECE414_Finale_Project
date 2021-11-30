#include "ProtothreadLibrary/pt_cornell_1_2_1.h"


static struct pt pt_track1;
int menu_state;
int PLAY;


static PT_THREAD (protothread_track1(struct pt *pt)) {
    PT_BEGIN(pt);
    
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

