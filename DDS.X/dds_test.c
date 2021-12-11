/* 
 * File:   dds_test.c - test DDS code
 * Author: John Nestor
 *
 * Created on October 27, 2020, 8:58 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <plib.h>
#include <stdint.h>
#include <stdfix.h>
#include <math.h>

#include "pt_cornell_1_2_1.h"

#include "dds.h"
#include "music.h"

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

uint32_t note_num;

uint8_t menu_state;

static struct pt pt_track1;

static PT_THREAD (protothread_track1(struct pt *pt)) {
    PT_BEGIN(pt);

    while(1) {              
        if(menu_state != PLAY) {
            PT_YIELD_TIME_msec(60);
            continue;
        }

        int sleep_time = Astley_dur1[note_num] ;

        PT_YIELD_TIME_msec(sleep_time);

        uint32_t freq = (uint32_t) (440*pow(2,((Astley_note1[note_num]-68)/12)));

        DDS_increment = freq * two32/Fs;

        note_num++;
    }
    PT_END(pt);
}

int main() {

    SYSTEMConfigPerformance(SYSCLK);
    CM1CON = 0; CM2CON = 0; ANSELA = 0; ANSELB = 0; // why disable comparators? not sure
    mPORTASetPinsDigitalOut(BIT_0);  // this was in Tahmid's example; not sure why
    
    DDS_phase = 0;
    
    note_num = 0;

    dds_init();
    INTEnableSystemMultiVectoredInt();
    dds_on(SYSCLK/Fs-1);
    
    menu_state = PLAY;
    
    PT_setup();
    PT_INIT(&pt_track1);
    
    while (1) {
        PT_SCHEDULE(protothread_track1(&pt_track1));
    }
    return (EXIT_SUCCESS);
}
