/* 
 * File:   debounce.h
 * This module debounces the input from button by setting it to high
 * after a press is detected
 */
#include <xc.h>
#include <inttypes.h>

static enum DBa_states {NPUSH, MAYPUSH, PUSHED, MAYNPUSH,DBa_SMStart} DBa_state;
uint8_t pressed;
void Init_DBa(){
    DBa_state = DBa_SMStart;
    pressed = 0x00;
}

void TickFct_DB(uint8_t btna)
{
    switch(DBa_state){
        case DBa_SMStart:
            DBa_state =  NPUSH;
            break;
        case NPUSH:
            if (btna==0x01){
                DBa_state = MAYPUSH;
            } else if (btna==0x00){
                DBa_state =  NPUSH;
            } 
            break;
        
        case MAYPUSH:
            if (btna==0x01){
                DBa_state = PUSHED;
                pressed = 0x01;
            } else if (btna==0x00){
                DBa_state =  NPUSH;
            } break;
        
        case PUSHED:
            if (btna==0x01){
                DBa_state = PUSHED;
            } else if (btna==0x00){
                DBa_state =  MAYNPUSH;
            } 
            break;
        
        case MAYNPUSH:
            if (btna==0x01){
                DBa_state = PUSHED;
            } else if (btna==0x00){
                DBa_state =  NPUSH;
            } 
            break;
    }
}