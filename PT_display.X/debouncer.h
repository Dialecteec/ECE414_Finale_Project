/* 
 * File:   debounce.h
 * This is a header file
 * This module debounces the input from button
 */

#ifndef DEBOUNCE_H
#define	DEBOUNCE_H

#include <stdint.h>
#include <xc.h>
#include <inttypes.h>

extern uint8_t pressed;
extern void TickFct_DBa(uint8_t btna);
extern void Init_DBa();

#endif	/* DEBOUNCE_H */
