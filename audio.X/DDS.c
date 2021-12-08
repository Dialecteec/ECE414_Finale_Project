/*
 * File: dds.c
 * Author: John Nestor (Derived from example code by Syed Tahmid Mahbub)
 * See: http://tahmidmc.blogspot.com/2014/10/pic32-spi-using-mcp4822-12-bit-serial.html
 * 
 * Direct Digital Synthesis to produce a sine and triangle wave via the DAC4822
 * Note: this module uses Timer1 with 1_1 prescale and multivectored
 * interrupts.  During initialization the main function must call
 * INTEnableSystemMultiVectoredInt();
 *  
 */

#include <xc.h>
#include <plib.h>

#include <math.h>
#include <stdint.h>
#include "dds.h"
#include "dac4822.h"

#include "port_expander_brl4.h"

#define SYSCLK	40000000UL
#define PBCLK	40000000UL


#define TABLE_SIZE 256
_Accum sineTable[TABLE_SIZE];
//int16_t triangleTable[TABLE_SIZE];

uint16_t note_time;

// phase accumulator for DDS
uint16_t DDS_phase;
uint16_t FM_DDS_phase;

// phase increment to set the frequency DDS_increment = Fout*two32/Fs
// For A above middle C DDS_increment =  = 42949673 = 440.0*two32/Fs
uint16_t DDS_increment = 0 ; //42949673 ;
uint16_t FM_DDS_increment = 0 ; //42949673 ;

// waveform amplitude
_Accum max_amplitude=2000;
// FM waveform amplitude
_Accum FM_max_amplitude=2000;
// waveform amplitude envelope parameters
// rise/fall time envelope 44 kHz samples
uint16_t attack_time=200, decay_time=35000, sustain_time=1000;
// FM waveform amplitude envelope parameters
uint16_t FM_attack_time=200, FM_decay_time=5000, FM_sustain_time=1000 ;
//  0<= current_amplitude < 2048
_Accum current_amplitude;
_Accum FM_current_amplitude = 0;
// amplitude change per sample during attack and decay
// no change during sustain

volatile _Accum attack_inc, decay_inc ;
volatile _Accum FM_attack_inc, FM_decay_inc ;


volatile uint16_t DAC_data_A, DAC_data_B ;// output values



static uint32_t dac_freq;  // frequency at which DAC outputs from table
static uint32_t timer_reset;
volatile uint8_t counter = 0;

void initTimer1(uint32_t timer_reset){
    OpenTimer1(T1_ON | T1_PS_1_1, timer_reset);
    // Configure T1 for DAC update frequency
    ConfigIntTimer1(T1_INT_ON | T1_INT_PRIOR_2);
    
}

void __ISR(_TIMER_1_VECTOR, ipl2) T1Int(void){
    
    mT2ClearIntFlag();
    
    DDS_phase += DDS_increment;
    DAC_data_B = (int) max_amplitude;
       
    if (note_time < (attack_time + decay_time + sustain_time) && DDS_increment != 0){
         //Peak control
        //current_amplitude = (note_time <= attack_time)?current_amplitude + attack_inc :(note_time <= attack_time + sustain_time)? current_amplitude:current_amplitude - decay_inc;
        if(note_time <= attack_time){
            current_amplitude = current_amplitude + attack_inc;
        } else if (attack_time < note_time <= attack_time + sustain_time){
            current_amplitude = current_amplitude;
        } else {
            current_amplitude = current_amplitude - decay_inc;
        }
        
        //Frequency modulation peak control
        //FM_current_amplitude = (note_time <= FM_attack_time)?FM_current_amplitude + FM_attack_inc :(note_time <= FM_attack_time + FM_sustain_time)? FM_current_amplitude:FM_current_amplitude - FM_decay_inc;
        if(note_time <= FM_attack_time){
            FM_current_amplitude = FM_current_amplitude + FM_attack_inc;
        } else if (FM_attack_time < note_time <= FM_attack_time + FM_sustain_time){
            FM_current_amplitude = FM_current_amplitude;
        } else {
            FM_current_amplitude = FM_current_amplitude - FM_decay_inc;
        }
             
        if(note_time >= FM_attack_time + FM_sustain_time + FM_decay_time) {
            FM_DDS_increment = 0;
            FM_current_amplitude = 0;
        }
           
        //Frequency modulation synthesis
        FM_DDS_phase += FM_DDS_increment;
        int FM_out = (int)(FM_current_amplitude*sineTable[FM_DDS_phase>>24]);
        DDS_phase += (FM_out << 16);
             
        DAC_data_A = (int)(current_amplitude*sineTable[DDS_phase>>24]) + 2048;
        DAC_data_B = (int)(FM_current_amplitude*sineTable[FM_DDS_phase>>24])/5 + 2048;
    } else {
        DAC_data_A = 2048;
        DDS_increment = 0;  
    }
    
    SPI_Mode16();// reset spi mode to 16bits avoiding conflict with expander
    
    write_dac4822(0, DAC_data_A); // write to channel A, gain = 1
    //write_dac4822(1, triangleTable[counter]); // write to channel B, gain = 1
    note_time++;
	mPORTAToggleBits(BIT_0);
}

// turn on DDS at the specified frequency using timer1 to interrupt
// each time a new output is needed
/*
void dds_on(uint32_t freq_hz) {
    dac_freq = freq_hz * TABLE_SIZE;
    timer_reset = PBCLK/dac_freq - 1;
    initTimer1(timer_reset);
    // maybe do some checking here?
    // turn on the interrupt!
    
}
*/
// turn off DDS by disabling timer interrupt
void dds_off() {
    CloseTimer1();
}

void generateTables(void){
    uint8_t i;
    for (i = 0; i<TABLE_SIZE; i++){
        sineTable[i] = (short) (2047.0 * sin(6.2832*((float)i)/(float)TABLE_SIZE));
        sineTable[i] = sineTable[i] + 2047;
/*
        if (i < TABLE_SIZE/2){
            triangleTable[i] = (i * (4096/(TABLE_SIZE/2))); // increasing part
        }
        else{
            triangleTable[i] = triangleTable[(TABLE_SIZE/2 - 1)-(i-TABLE_SIZE/2)]; // mirror to get decreasing part
        }
*/
    }
}

void dds_init()
{
    generateTables();
    init_dac4822();
    // don't forget: main() must call INTEnableSystemMultiVectoredInt(); )
}
