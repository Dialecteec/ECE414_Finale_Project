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


#include "dds.h"

// pragmas
#include "config.h"
/*
 * 
 */

#define SYSCLK	40000000UL
#define PBCLK	40000000UL

#define two32 4294967296.0 // 2^32 //constant for setting DDS frequency
#define Fs 44000.0 // audio sample frequency

int main() {

    SYSTEMConfigPerformance(SYSCLK);
    CM1CON = 0; CM2CON = 0; ANSELA = 0; ANSELB = 0; // why disable comparators? not sure
    mPORTASetPinsDigitalOut(BIT_0);  // this was in Tahmid's example; not sure why
    
    DDS_phase = 0;
    
    int freq = 364;
    DDS_increment = freq * two32/Fs;
    
    dds_init();
    INTEnableSystemMultiVectoredInt();
    dds_on(SYSCLK/Fs-1);
    
    while (1) {
    }
    return (EXIT_SUCCESS);
}
