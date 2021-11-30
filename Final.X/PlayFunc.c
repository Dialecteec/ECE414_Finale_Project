#include "tft_gfx.h"
#include "tft_master.h"

//240x320

void tft_initGame(){
    tft_drawLine(120,60,120,320,ILI9341_WHITE);
}
void redrawCircle(){
    //int left_ball_r = left_hard ? BIGBALL_RADIUS : BALL_RADIUS;
    //int right_ball_r = right_hard ? BIGBALL_RADIUS : BALL_RADIUS;
    if(left_display_frame >= 3) {
        //tft_fillCircle(LEFT_POS, 300, BIGBALL_RADIUS, ILI9340_BLACK);
        //tft_drawCircle(LEFT_POS, 300, left_ball_r, ILI9340_WHITE);
        tft_drawTriangle(short x0, short y0, short x1, short y1, short x2, short y2, unsigned short color);
        tft_fillTriangle(short x0, short y0, short x1, short y1, short x2, short y2, unsigned short color);
    } else {
        //tft_fillCircle(LEFT_POS, 300, left_ball_r, ILI9340_YELLOW);
    }
    if(right_display_frame >= 3) {
        //tft_fillCircle(RIGHT_POS, 300, BIGBALL_RADIUS, ILI9340_BLACK);
        //tft_drawCircle(RIGHT_POS, 300, right_ball_r, ILI9340_WHITE);
    } else {
        //tft_fillCircle(RIGHT_POS, 300, right_ball_r, ILI9340_YELLOW);
    }
}
void updatePos(int x, int y, int color, int hard) {
    int r = hard ? BIGBALL_RADIUS : BALL_RADIUS;
    tft_fillCircle(x, y, r, ILI9340_BLACK); //x, y, radius, color
    switch (color) {
        case 0: tft_fillCircle(x, y + FALL_SPEED, r, ILI9340_RED); break;
        case 1: tft_fillCircle(x, y + FALL_SPEED, r, ILI9340_GREEN); break;
    }
   
}
void printLine(int line_number, char* print_buffer, short text_color, short back_color){
    // line number 0 to 31
    /// !!! assumes tft_setRotation(0);
    // print_buffer is the string to print
    int v_pos;
    v_pos = line_number * 10 ;
    // erase the pixels
    tft_fillRoundRect(0, v_pos, 239, 8, 1, back_color);// x,y,w,h,radius,color
    tft_setTextColor(text_color);
    tft_setCursor(0, v_pos);
    tft_setTextSize(1);
    tft_writeString(print_buffer);
}
