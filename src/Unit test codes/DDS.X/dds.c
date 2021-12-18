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

#include <math.h>
#include <stdint.h>
#include <stdfix.h>
#include <stdio.h>
#include "dds.h"
#include "dac4822.h"

#define TABLE_SIZE 256
volatile _Accum sineTable[TABLE_SIZE];

volatile uint32_t DAC_data_A, DAC_data_B;

uint32_t DDS_phaseA, DDS_incrementA, DDS_phaseB, DDS_incrementB;

#define SYSCLK	40000000UL
#define PBCLK	40000000UL

static uint32_t dac_freq;  // frequency at which DAC outputs from table


void initTimer1(uint32_t timer_reset){
    OpenTimer1(T1_ON | T1_PS_1_1, timer_reset);
    // Configure T1 for DAC update frequency
    ConfigIntTimer1(T1_INT_ON | T1_INT_PRIOR_2);
    
}

void __ISR(_TIMER_1_VECTOR, ipl2) T1Int(void){
    DDS_phaseA += DDS_incrementA;
    DDS_phaseB += DDS_incrementB;
    
    if (DDS_incrementA !=0 ){
        DAC_data_A = (int)(2047*sineTable[(DDS_phaseA>>24)])+ 2047;//use the most sig 8 bits of accumulator to index
    } else {
        DAC_data_A = 2047;
    }
    
    if (DDS_incrementB !=0 ){
        DAC_data_B = (int)(2047*sineTable[(DDS_phaseB>>24)])+ 2047;//use the most sig 8 bits of accumulator to index
    } else {
        DAC_data_B = 2047;
    }
    
    write_dac4822(0, DAC_data_A & 0xfff); // write to channel A, gain = 1, 16bits
    write_dac4822(1, DAC_data_B & 0xfff); // write to channel A, gain = 1, 16bits
    //if (((int)(DDS_phaseA>>24)) >= TABLE_SIZE) DDS_phaseA = 0;

    int junk;
    junk = ReadSPI2();
    
	mPORTAToggleBits(BIT_0);
    mT1ClearIntFlag();
}

// turn on DDS at the specified frequency using timer1 to interrupt
// each time a new output is needed
void dds_on(uint32_t freq_hz) {
    initTimer1(freq_hz);
    // maybe do some checking here?
    // turn on the interrupt!
}

// turn off DDS by disabling timer interrupt
void dds_off() {
    CloseTimer1();
}

void generateTables(void){
    int i;
    for (i = 0; i<TABLE_SIZE; i++){
        sineTable[i] = (_Accum) (sin(6.2832*((float)i)/(float)TABLE_SIZE));
    }
}

void dds_init()
{
    generateTables();
    init_dac4822();
    // don't forget: main() must call INTEnableSystemMultiVectoredInt(); )
}
