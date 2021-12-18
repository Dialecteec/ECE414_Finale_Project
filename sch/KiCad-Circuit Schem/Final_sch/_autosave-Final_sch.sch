EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Final_sch-rescue:PIC32MX250F128B-V_SP-PIC32MX250F128B-alb6_sch-rescue U1
U 1 1 6183E825
P 7900 4600
F 0 "U1" H 7350 5867 50  0000 C CNN
F 1 "PIC32MX250F128B-V_SP" H 7350 5776 50  0000 C CNN
F 2 "DIP254P762X508-28" H 7900 4600 50  0001 L BNN
F 3 "SPDIP-28 Microchip" H 7900 4600 50  0001 L BNN
F 4 "PIC32MX250F128B-V/SP" H 7900 4600 50  0001 L BNN "Field4"
F 5 "32 Bit MCU, 128KB Flash, 32KB RAM, 40 MHz, 28 Pin, 3 Comp, CTMU, RTCC, 28 SPDIP" H 7900 4600 50  0001 L BNN "Field5"
F 6 "Microchip" H 7900 4600 50  0001 L BNN "Field6"
F 7 "None" H 7900 4600 50  0001 L BNN "Field7"
F 8 "Unavailable" H 7900 4600 50  0001 L BNN "Field8"
	1    7900 4600
	1    0    0    -1  
$EndComp
$Comp
L Final_sch-rescue:LCD_2_4-lcd_2_4-alb6_sch-rescue U2
U 1 1 618BDCD1
P 4700 1500
F 0 "U2" H 5828 1721 50  0000 L CNN
F 1 "LCD_2_4" H 5828 1630 50  0000 L CNN
F 2 "" H 4800 1650 50  0001 C CNN
F 3 "" H 4800 1650 50  0001 C CNN
	1    4700 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 4100 8600 4100
Wire Wire Line
	3850 1950 3850 4000
Wire Wire Line
	3950 1950 3950 3900
Wire Wire Line
	4050 1950 4050 2100
Wire Wire Line
	5350 2100 5350 1950
Wire Wire Line
	4050 2100 5350 2100
Wire Wire Line
	5350 2100 5450 2100
Wire Wire Line
	5450 2100 5450 1950
Connection ~ 5350 2100
Wire Wire Line
	5450 2100 5550 2100
Wire Wire Line
	5550 2100 5550 1950
Connection ~ 5450 2100
Wire Wire Line
	8600 4400 8800 4400
Wire Wire Line
	4350 1950 4350 2200
Wire Wire Line
	8800 2200 8800 4400
Wire Wire Line
	4150 1950 4150 2300
Wire Wire Line
	8700 2300 8700 4100
Wire Wire Line
	4350 2200 8800 2200
Wire Wire Line
	4150 2300 8700 2300
Wire Wire Line
	6100 4300 5150 4300
Wire Wire Line
	5150 4300 5150 1950
Wire Wire Line
	6100 4400 4850 4400
Wire Wire Line
	4850 4400 4850 1950
Wire Wire Line
	6100 4500 4550 4500
Wire Wire Line
	4550 4500 4550 1950
Wire Wire Line
	6100 4600 4450 4600
Wire Wire Line
	4450 4600 4450 1950
Wire Wire Line
	6100 4700 4650 4700
Wire Wire Line
	4650 4700 4650 1950
Wire Wire Line
	6100 5100 5050 5100
Wire Wire Line
	5050 5100 5050 1950
Wire Wire Line
	3950 3900 6100 3900
Wire Wire Line
	6100 5000 4950 5000
Wire Wire Line
	4950 5000 4950 1950
$Comp
L Analog_DAC:MCP4822 U3
U 1 1 61BC0078
P 4350 5900
F 0 "U3" H 4350 5219 50  0000 C CNN
F 1 "MCP4822" H 4350 5310 50  0000 C CNN
F 2 "" H 5150 5600 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf" H 5150 5600 50  0001 C CNN
	1    4350 5900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6550 5200 6100 5200
Wire Wire Line
	5000 5200 5000 5700
Wire Wire Line
	5000 5700 4850 5700
Wire Wire Line
	6550 5400 6100 5400
Wire Wire Line
	5200 5400 5200 5800
Wire Wire Line
	5200 5800 4850 5800
Wire Wire Line
	4350 5400 4350 4000
Wire Wire Line
	3850 4000 4350 4000
Connection ~ 4350 4000
Wire Wire Line
	4350 4000 6100 4000
Connection ~ 6100 5200
Wire Wire Line
	6100 5200 5000 5200
Connection ~ 6100 5400
Wire Wire Line
	6100 5400 5200 5400
Wire Wire Line
	4350 6300 3750 6300
Wire Wire Line
	3750 6300 3750 5000
Wire Wire Line
	3750 5000 3950 5000
Wire Wire Line
	3950 5000 3950 3900
Connection ~ 3950 3900
$Comp
L power:GND #PWR?
U 1 1 61BC937B
P 5550 5700
F 0 "#PWR?" H 5550 5450 50  0001 C CNN
F 1 "GND" H 5555 5527 50  0000 C CNN
F 2 "" H 5550 5700 50  0001 C CNN
F 3 "" H 5550 5700 50  0001 C CNN
	1    5550 5700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4850 5900 5550 5900
Wire Wire Line
	5550 5900 5550 5700
Wire Wire Line
	4850 6000 8900 6000
Wire Wire Line
	8900 6000 8900 4000
Wire Wire Line
	8900 4000 8600 4000
$Comp
L Device:Speaker LS1
U 1 1 61BCB820
P 2450 5700
F 0 "LS1" H 2413 5283 50  0000 C CNN
F 1 "Speaker" H 2413 5374 50  0000 C CNN
F 2 "" H 2450 5500 50  0001 C CNN
F 3 "~" H 2440 5650 50  0001 C CNN
	1    2450 5700
	-1   0    0    1   
$EndComp
$Comp
L Device:Speaker LS2
U 1 1 61BB4B4B
P 2450 6300
F 0 "LS2" H 2413 5883 50  0000 C CNN
F 1 "Speaker" H 2413 5974 50  0000 C CNN
F 2 "" H 2450 6100 50  0001 C CNN
F 3 "~" H 2440 6250 50  0001 C CNN
	1    2450 6300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 61BBD5A6
P 3450 5700
F 0 "R1" V 3243 5700 50  0000 C CNN
F 1 "560 Ohm" V 3334 5700 50  0000 C CNN
F 2 "" V 3380 5700 50  0001 C CNN
F 3 "~" H 3450 5700 50  0001 C CNN
	1    3450 5700
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 61BBDF94
P 2950 5550
F 0 "C1" H 2835 5504 50  0000 R CNN
F 1 "1uF" H 2835 5595 50  0000 R CNN
F 2 "" H 2988 5400 50  0001 C CNN
F 3 "~" H 2950 5550 50  0001 C CNN
	1    2950 5550
	-1   0    0    1   
$EndComp
Wire Wire Line
	3850 5700 3600 5700
Wire Wire Line
	2650 5600 2650 5400
Wire Wire Line
	2650 5400 2950 5400
Wire Wire Line
	3500 5400 3500 5150
Wire Wire Line
	3500 4000 3850 4000
Connection ~ 3850 4000
Connection ~ 2950 5400
Connection ~ 2950 5700
Wire Wire Line
	2950 5700 2650 5700
Wire Wire Line
	2950 5700 3300 5700
Wire Wire Line
	2950 5400 3500 5400
$Comp
L Device:C C2
U 1 1 61BCA46D
P 3050 6350
F 0 "C2" H 2935 6304 50  0000 R CNN
F 1 "1uF" H 2935 6395 50  0000 R CNN
F 2 "" H 3088 6200 50  0001 C CNN
F 3 "~" H 3050 6350 50  0001 C CNN
	1    3050 6350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 61BCBB2F
P 3450 6200
F 0 "R2" V 3243 6200 50  0000 C CNN
F 1 "560 Ohm" V 3334 6200 50  0000 C CNN
F 2 "" V 3380 6200 50  0001 C CNN
F 3 "~" H 3450 6200 50  0001 C CNN
	1    3450 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	3850 6000 3700 6000
Wire Wire Line
	3700 6000 3700 6200
Wire Wire Line
	3700 6200 3600 6200
Wire Wire Line
	3300 6200 3050 6200
Wire Wire Line
	3050 6200 2650 6200
Connection ~ 3050 6200
Wire Wire Line
	2650 6300 2650 6500
Wire Wire Line
	2650 6500 3050 6500
Wire Wire Line
	2650 6500 2200 6500
Wire Wire Line
	2200 6500 2200 5150
Wire Wire Line
	2200 5150 3500 5150
Connection ~ 2650 6500
Connection ~ 3500 5150
Wire Wire Line
	3500 5150 3500 4000
$EndSCHEMATC
