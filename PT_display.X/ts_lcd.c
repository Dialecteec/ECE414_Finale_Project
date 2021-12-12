#include <xc.h>
#include "ts_lcd.h"
#include "TouchScreen.h"
#include <math.h>

int16_t thresholdZ = 200;
int16_t thresholdYU = 900;
int16_t thresholdYL = 100;
int16_t thresholdXU = 890;
int16_t thresholdXL = 150;
int16_t lcdY = 319;
int16_t lcdX = 239;

uint8_t ts_lcd_get_ts(uint16_t *x, uint16_t *y) {
    struct TSPoint p;
    getPoint(&p);
    if (p.z > 100) {
        int16_t xTemp;
        int16_t yTemp;
        xTemp = ((p.x - thresholdXL) * lcdX) / (thresholdXU - thresholdXL);
        yTemp = ((p.y - thresholdYL) * lcdY) / (thresholdYU - thresholdYL);
        *x = xTemp;
        *y = yTemp;
        return 0x01;
    }
    return 0x00;
}