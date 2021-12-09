/* 
 * File:   dds.h
 * Author: nestorj
 * See: http://tahmidmc.blogspot.com/2014/10/pic32-spi-using-mcp4822-12-bit-serial.html
 * 
 * Direct Digital Synthesis to produce a sine and triangle wave via the DAC4822
 * Note: this module uses Timer1 with 1_1 prescale and multivectored
 * interrupts.  During initialization the main function must call
 * INTEnableSystemMultiVectoredInt(); 
 * 
 */

#ifndef DDS_H
#define	DDS_H

#include <stdint.h>

// audio sample frequency
#define Fs 44000.0
// need this constant for setting DDS frequency
#define two32 4294967296.0 // 2^32
// sine lookup table for DDS
#define TABLE_SIZE 256

extern _Accum sineTable[TABLE_SIZE];

extern uint16_t note_time;

extern uint16_t DDS_phase;
extern uint16_t FM_DDS_phase;

extern uint16_t DDS_increment;
extern uint16_t FM_DDS_increment;

extern _Accum max_amplitude;

extern _Accum FM_max_amplitude;

extern uint16_t attack_time, decay_time, sustain_time;

extern uint16_t FM_attack_time, FM_decay_time, FM_sustain_time;

extern _Accum current_amplitude;
extern _Accum FM_current_amplitude;

extern volatile _Accum attack_inc, decay_inc;
extern volatile _Accum FM_attack_inc, FM_decay_inc;


void dds_init();

void dds_on(uint32_t freq_hz);

void dds_off();


#endif	/* DDS_H */