//ProtoThread
#include <xc.h>
#include <plib.h>
#include <math.h>
#include <stdint.h>
#include <stdfix.h>

#include "config.h"
#include "pt_cornell_1_2_1.h"
#include "pt_config.h"

#include "dds.h"

#include "music.h"


#define start_spi2_critical_setion INTEnable(INT_T2, 0)
#define end_spi2_critical_setion INTEnable(INT_T2, 1)

#define two32 4294967296.0 // 2^32 //constant for setting DDS frequency
#define Fs 44000.0// audio sample frequency

#define PLAY 4

static struct pt pt_track1;
unsigned int menu_state;
unsigned int note_index = 0;

static PT_THREAD (protothread_track1(struct pt *pt)) {
    PT_BEGIN(pt);
    
    while(1) {              
        if(menu_state != PLAY) {
            PT_YIELD_TIME_msec(60);
            continue;
        }
        
        int sleep_time =  Astley_dur1[note_index];

        PT_YIELD_TIME_msec(sleep_time);
        //note_time=0;
        //current_amplitude = 0;
        //FM_current_amplitude = 0;
        int freq = (short) (440*pow(2,((Astley_note1[note_index]-68)/12)));
        DDS_increment = freq * two32/Fs;
        //FM_DDS_increment = 3 * freq * two32/Fs ;
               
        note_index++;
       
    }
    PT_END(pt);
}

void main(void) {
    
    INTEnableSystemMultiVectoredInt();

    dds_init();
    dds_on(908);
    
    //attack_inc = max_amplitude/(_Accum)attack_time;
    //decay_inc = max_amplitude/(_Accum)decay_time;
    
    //FM_attack_inc = FM_max_amplitude/(_Accum)FM_attack_time;
    //FM_decay_inc = FM_max_amplitude/(_Accum)FM_decay_time;
    
    PT_setup();
    
    PT_INIT(&pt_track1);
    
    menu_state = PLAY;
    
    while (1){
        PT_SCHEDULE(protothread_track1(&pt_track1));
    }


}