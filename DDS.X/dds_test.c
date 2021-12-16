#include "notes.h"
#include "songs.h"

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <plib.h>
#include <stdint.h>
#include <stdfix.h>
#include <math.h>

#include "pt_cornell_1_2_1.h"

#include "dds.h"
#include "midi_music.h"

// pragmas
#include "config.h"
/*
 * 
 */

#define SYSCLK	40000000UL
#define PBCLK	40000000UL

#define two32 4294967296.0 // 2^32 //constant for setting DDS frequency
#define Fs 44000.0 // audio sample frequency

#define PLAY 1

uint32_t note_numA, note_numB;

uint8_t menu_state;

struct music *current_song;

static struct pt pt_track1, pt_track2;

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

int main() {

    SYSTEMConfigPerformance(SYSCLK);
    CM1CON = 0; CM2CON = 0; ANSELA = 0; ANSELB = 0; // why disable comparators? not sure
    mPORTASetPinsDigitalOut(BIT_0);  // this was in Tahmid's example; not sure why
    
    DDS_phaseA = 0;
    DDS_phaseB = 0;
    
    note_numA = 0;
    note_numB = 0;

    dds_init();
    INTEnableSystemMultiVectoredInt();
    dds_on(SYSCLK/Fs-1);
    
    musicInit();
    current_song = &twinkle;
    
    menu_state = PLAY;
    
    PT_setup();
    PT_INIT(&pt_track1);
    PT_INIT(&pt_track2);
    
    while (1) {
        PT_SCHEDULE(protothread_track1(&pt_track1));
        PT_SCHEDULE(protothread_track2(&pt_track2));
    }
    return (EXIT_SUCCESS);
}
