#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/test_touch_rev.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/test_touch_rev.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=TouchScreen.c adc_intf.c touch_main_example.c Adafruit_2_4_LCD_Serial_Library/glcdfont.c Adafruit_2_4_LCD_Serial_Library/tft_gfx.c Adafruit_2_4_LCD_Serial_Library/tft_master.c Adafruit_2_4_LCD_Serial_Library/ts_lcd.c Adafruit_2_4_LCD_Serial_Library/debouncer.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/TouchScreen.o ${OBJECTDIR}/adc_intf.o ${OBJECTDIR}/touch_main_example.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o
POSSIBLE_DEPFILES=${OBJECTDIR}/TouchScreen.o.d ${OBJECTDIR}/adc_intf.o.d ${OBJECTDIR}/touch_main_example.o.d ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o.d ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o.d ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o.d ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o.d ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/TouchScreen.o ${OBJECTDIR}/adc_intf.o ${OBJECTDIR}/touch_main_example.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o

# Source Files
SOURCEFILES=TouchScreen.c adc_intf.c touch_main_example.c Adafruit_2_4_LCD_Serial_Library/glcdfont.c Adafruit_2_4_LCD_Serial_Library/tft_gfx.c Adafruit_2_4_LCD_Serial_Library/tft_master.c Adafruit_2_4_LCD_Serial_Library/ts_lcd.c Adafruit_2_4_LCD_Serial_Library/debouncer.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/test_touch_rev.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX250F128B
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/TouchScreen.o: TouchScreen.c  .generated_files/flags/default/388f76a4780857a4435943ef30ca1080ad034f60 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TouchScreen.o.d 
	@${RM} ${OBJECTDIR}/TouchScreen.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/TouchScreen.o.d" -o ${OBJECTDIR}/TouchScreen.o TouchScreen.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/adc_intf.o: adc_intf.c  .generated_files/flags/default/e51f7a7ae42cbcf301e7ef5bb373c72648954408 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc_intf.o.d 
	@${RM} ${OBJECTDIR}/adc_intf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/adc_intf.o.d" -o ${OBJECTDIR}/adc_intf.o adc_intf.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/touch_main_example.o: touch_main_example.c  .generated_files/flags/default/af8c5cf6708ad53e5d661fc6cdbd06305ee276f1 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/touch_main_example.o.d 
	@${RM} ${OBJECTDIR}/touch_main_example.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/touch_main_example.o.d" -o ${OBJECTDIR}/touch_main_example.o touch_main_example.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o: Adafruit_2_4_LCD_Serial_Library/glcdfont.c  .generated_files/flags/default/6765c2d5aa912b4c51c55a801c4deca0f706a0a9 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o Adafruit_2_4_LCD_Serial_Library/glcdfont.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o: Adafruit_2_4_LCD_Serial_Library/tft_gfx.c  .generated_files/flags/default/b2781405659f2039fb4f2521afafe4416d53b53f .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o Adafruit_2_4_LCD_Serial_Library/tft_gfx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o: Adafruit_2_4_LCD_Serial_Library/tft_master.c  .generated_files/flags/default/d6ccaf8764761d50be60ec5235bfcbf05d70218 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o Adafruit_2_4_LCD_Serial_Library/tft_master.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o: Adafruit_2_4_LCD_Serial_Library/ts_lcd.c  .generated_files/flags/default/68469d694ed9c7a7eb92d1c92b4b66331e3faa93 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o Adafruit_2_4_LCD_Serial_Library/ts_lcd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o: Adafruit_2_4_LCD_Serial_Library/debouncer.c  .generated_files/flags/default/bda4d66d72fc8b310573178faf6f4ae47abaa110 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o Adafruit_2_4_LCD_Serial_Library/debouncer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
else
${OBJECTDIR}/TouchScreen.o: TouchScreen.c  .generated_files/flags/default/d4d08604dee8891d53a5b24b480cb0e6b11c1503 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TouchScreen.o.d 
	@${RM} ${OBJECTDIR}/TouchScreen.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/TouchScreen.o.d" -o ${OBJECTDIR}/TouchScreen.o TouchScreen.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/adc_intf.o: adc_intf.c  .generated_files/flags/default/1a8d90323da931073ea1c77cf6a21124febf145c .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc_intf.o.d 
	@${RM} ${OBJECTDIR}/adc_intf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/adc_intf.o.d" -o ${OBJECTDIR}/adc_intf.o adc_intf.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/touch_main_example.o: touch_main_example.c  .generated_files/flags/default/2109a510ccde713068c7521695bf0350fb0de277 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/touch_main_example.o.d 
	@${RM} ${OBJECTDIR}/touch_main_example.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/touch_main_example.o.d" -o ${OBJECTDIR}/touch_main_example.o touch_main_example.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o: Adafruit_2_4_LCD_Serial_Library/glcdfont.c  .generated_files/flags/default/236d180f8874b843167c8f4e437bdc31d0be86f0 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o Adafruit_2_4_LCD_Serial_Library/glcdfont.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o: Adafruit_2_4_LCD_Serial_Library/tft_gfx.c  .generated_files/flags/default/419cd15a1b7efd60ac77edd340bb9d054c53a9d2 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o Adafruit_2_4_LCD_Serial_Library/tft_gfx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o: Adafruit_2_4_LCD_Serial_Library/tft_master.c  .generated_files/flags/default/c4c0e15d186b45cd4d11cbca508bd64ff3bbe1b1 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o Adafruit_2_4_LCD_Serial_Library/tft_master.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o: Adafruit_2_4_LCD_Serial_Library/ts_lcd.c  .generated_files/flags/default/dd6a7dffdf76058723265f4895ba3b5c89329c18 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/ts_lcd.o Adafruit_2_4_LCD_Serial_Library/ts_lcd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o: Adafruit_2_4_LCD_Serial_Library/debouncer.c  .generated_files/flags/default/3ffa1aa016c7795e0423271bedff43b5d0dd477c .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"Adafruit_2_4_LCD_Serial_Library" -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/debouncer.o Adafruit_2_4_LCD_Serial_Library/debouncer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -D_SUPPRESS_PLIB_WARNING   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/test_touch_rev.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/test_touch_rev.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  -D_SUPPRESS_PLIB_WARNING $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/test_touch_rev.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/test_touch_rev.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  -D_SUPPRESS_PLIB_WARNING $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/test_touch_rev.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
