#ifndef SONGS_H
#define	SONGS_H

#include <stdint.h>

struct music
{
    uint16_t track1_len;
    uint16_t track2_len;
    
    uint8_t highest_score;
    uint8_t latest_score;
    
    uint16_t (*track1_note)[];
    uint16_t (*track1_dur)[];
    
    uint16_t (*track2_note)[];
    uint16_t (*track2_dur)[];
    
    uint16_t base_dur;
    
    char *song_name;
};
extern struct music twinkle, mario, amazing, Astley;

void musicInit();

// Twinkle Twinkle
extern uint16_t twinkle_base_dur; //duration in ms for base note
extern uint16_t twinkle_note1[];
extern uint16_t twinkle_dur1[];
extern uint16_t twinkle_note2[];
extern uint16_t twinkle_dur2[]; //0 ends song

// Super Mario
extern uint16_t mario_base_dur; //150 //duration in ms for base note
extern uint16_t mario_note1[];
extern uint16_t mario_dur1[];
extern uint16_t mario_note2[];
extern uint16_t mario_dur2[]; //0 ends song

//Amazing Grace
extern uint16_t amazing_base_dur; //duration in ms for eighth note
extern uint16_t amazing_note1[];
extern uint16_t amazing_dur1[];
extern uint16_t amazing_note2[];
extern uint16_t amazing_dur2[]; //0 ends song

#endif	/* LAB3_SONGS_H */