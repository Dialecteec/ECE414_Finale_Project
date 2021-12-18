/* 
 * File:   ts_lcd.h
 * This is a header file
 * Detects where touch screen is pressed, converts to LCD coordinates
 */

#include <plib.h>
#include <xc.h>

extern int16_t thresholdZ;
extern int16_t thresholdYU;
extern int16_t thresholdYL;
extern int16_t thresholdXU;
extern int16_t thresholdXL;


extern uint8_t ts_lcd_get_ts(uint16_t *x, uint16_t *y);