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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PT_display.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PT_display.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=tft_master.c tft_gfx.c glcdfont.c adc_intf.c TouchScreen.c ts_lcd.c PT.c dac4822.c dds.c songs.c midi_music.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/tft_master.o ${OBJECTDIR}/tft_gfx.o ${OBJECTDIR}/glcdfont.o ${OBJECTDIR}/adc_intf.o ${OBJECTDIR}/TouchScreen.o ${OBJECTDIR}/ts_lcd.o ${OBJECTDIR}/PT.o ${OBJECTDIR}/dac4822.o ${OBJECTDIR}/dds.o ${OBJECTDIR}/songs.o ${OBJECTDIR}/midi_music.o
POSSIBLE_DEPFILES=${OBJECTDIR}/tft_master.o.d ${OBJECTDIR}/tft_gfx.o.d ${OBJECTDIR}/glcdfont.o.d ${OBJECTDIR}/adc_intf.o.d ${OBJECTDIR}/TouchScreen.o.d ${OBJECTDIR}/ts_lcd.o.d ${OBJECTDIR}/PT.o.d ${OBJECTDIR}/dac4822.o.d ${OBJECTDIR}/dds.o.d ${OBJECTDIR}/songs.o.d ${OBJECTDIR}/midi_music.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/tft_master.o ${OBJECTDIR}/tft_gfx.o ${OBJECTDIR}/glcdfont.o ${OBJECTDIR}/adc_intf.o ${OBJECTDIR}/TouchScreen.o ${OBJECTDIR}/ts_lcd.o ${OBJECTDIR}/PT.o ${OBJECTDIR}/dac4822.o ${OBJECTDIR}/dds.o ${OBJECTDIR}/songs.o ${OBJECTDIR}/midi_music.o

# Source Files
SOURCEFILES=tft_master.c tft_gfx.c glcdfont.c adc_intf.c TouchScreen.c ts_lcd.c PT.c dac4822.c dds.c songs.c midi_music.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PT_display.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/tft_master.o: tft_master.c  .generated_files/flags/default/415b936df524d8ae275872a734c2aed43be748 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tft_master.o.d 
	@${RM} ${OBJECTDIR}/tft_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/tft_master.o.d" -o ${OBJECTDIR}/tft_master.o tft_master.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/tft_gfx.o: tft_gfx.c  .generated_files/flags/default/6d2953508f8aea0ffadab4e635f1e5f79cfe04ed .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tft_gfx.o.d 
	@${RM} ${OBJECTDIR}/tft_gfx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/tft_gfx.o.d" -o ${OBJECTDIR}/tft_gfx.o tft_gfx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/glcdfont.o: glcdfont.c  .generated_files/flags/default/8404a55d7e19d5a63035def2621ce7d4268d314b .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/glcdfont.o.d 
	@${RM} ${OBJECTDIR}/glcdfont.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/glcdfont.o.d" -o ${OBJECTDIR}/glcdfont.o glcdfont.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/adc_intf.o: adc_intf.c  .generated_files/flags/default/7b970e19d35725123675a6292684aee4cca8e439 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc_intf.o.d 
	@${RM} ${OBJECTDIR}/adc_intf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/adc_intf.o.d" -o ${OBJECTDIR}/adc_intf.o adc_intf.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/TouchScreen.o: TouchScreen.c  .generated_files/flags/default/6f551eb7391c64ddd9e9b03248977a16c5d3e1f7 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TouchScreen.o.d 
	@${RM} ${OBJECTDIR}/TouchScreen.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TouchScreen.o.d" -o ${OBJECTDIR}/TouchScreen.o TouchScreen.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/ts_lcd.o: ts_lcd.c  .generated_files/flags/default/1ccdce532fde22ceaa19dc36db4d2c6042aca5d0 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ts_lcd.o.d 
	@${RM} ${OBJECTDIR}/ts_lcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ts_lcd.o.d" -o ${OBJECTDIR}/ts_lcd.o ts_lcd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/PT.o: PT.c  .generated_files/flags/default/af2641d20852576fb527240e2bfa3fbc70126023 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PT.o.d 
	@${RM} ${OBJECTDIR}/PT.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/PT.o.d" -o ${OBJECTDIR}/PT.o PT.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/dac4822.o: dac4822.c  .generated_files/flags/default/6e87154c95c2b74e8515ade3083ced0fe710cee1 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dac4822.o.d 
	@${RM} ${OBJECTDIR}/dac4822.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dac4822.o.d" -o ${OBJECTDIR}/dac4822.o dac4822.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/dds.o: dds.c  .generated_files/flags/default/fea1f1eff912132ae379b55016ab52e5115c70bb .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dds.o.d 
	@${RM} ${OBJECTDIR}/dds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dds.o.d" -o ${OBJECTDIR}/dds.o dds.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/songs.o: songs.c  .generated_files/flags/default/7b700ca58360f242fe15e146bcd36a2846888501 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/songs.o.d 
	@${RM} ${OBJECTDIR}/songs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/songs.o.d" -o ${OBJECTDIR}/songs.o songs.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/midi_music.o: midi_music.c  .generated_files/flags/default/2b0b7ea997fe7b6c2fab0c51133de49479188872 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/midi_music.o.d 
	@${RM} ${OBJECTDIR}/midi_music.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/midi_music.o.d" -o ${OBJECTDIR}/midi_music.o midi_music.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/tft_master.o: tft_master.c  .generated_files/flags/default/14fdd8b10a5afb15c0bf18707e2c89cbc287a1fd .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tft_master.o.d 
	@${RM} ${OBJECTDIR}/tft_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/tft_master.o.d" -o ${OBJECTDIR}/tft_master.o tft_master.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/tft_gfx.o: tft_gfx.c  .generated_files/flags/default/e12e116cd2a0baab29e594c47984d89a9b61db05 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tft_gfx.o.d 
	@${RM} ${OBJECTDIR}/tft_gfx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/tft_gfx.o.d" -o ${OBJECTDIR}/tft_gfx.o tft_gfx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/glcdfont.o: glcdfont.c  .generated_files/flags/default/198f8c2cc1d6fc081f636f5d00e3d0c46b1fb9bc .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/glcdfont.o.d 
	@${RM} ${OBJECTDIR}/glcdfont.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/glcdfont.o.d" -o ${OBJECTDIR}/glcdfont.o glcdfont.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/adc_intf.o: adc_intf.c  .generated_files/flags/default/3a0a5785f2de8739ded15da62ef52a016718414a .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc_intf.o.d 
	@${RM} ${OBJECTDIR}/adc_intf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/adc_intf.o.d" -o ${OBJECTDIR}/adc_intf.o adc_intf.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/TouchScreen.o: TouchScreen.c  .generated_files/flags/default/7959d8bea173cd24f45fc7157f1f711f98a1c019 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TouchScreen.o.d 
	@${RM} ${OBJECTDIR}/TouchScreen.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TouchScreen.o.d" -o ${OBJECTDIR}/TouchScreen.o TouchScreen.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/ts_lcd.o: ts_lcd.c  .generated_files/flags/default/2c295dcc88e1be13a61cac246d789a97c330ab30 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ts_lcd.o.d 
	@${RM} ${OBJECTDIR}/ts_lcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ts_lcd.o.d" -o ${OBJECTDIR}/ts_lcd.o ts_lcd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/PT.o: PT.c  .generated_files/flags/default/3129507fcb449b2e433f824a9f6d60e1f53198ca .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PT.o.d 
	@${RM} ${OBJECTDIR}/PT.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/PT.o.d" -o ${OBJECTDIR}/PT.o PT.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/dac4822.o: dac4822.c  .generated_files/flags/default/e3b9cfa186f9bcf3e389294e446d73004758ef57 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dac4822.o.d 
	@${RM} ${OBJECTDIR}/dac4822.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dac4822.o.d" -o ${OBJECTDIR}/dac4822.o dac4822.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/dds.o: dds.c  .generated_files/flags/default/7efa91eafbda57665723f45c9d94e1de7964e5ec .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dds.o.d 
	@${RM} ${OBJECTDIR}/dds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dds.o.d" -o ${OBJECTDIR}/dds.o dds.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/songs.o: songs.c  .generated_files/flags/default/5ea27ecde9ed115af2b74e44c46bacbcee574a0b .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/songs.o.d 
	@${RM} ${OBJECTDIR}/songs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/songs.o.d" -o ${OBJECTDIR}/songs.o songs.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/midi_music.o: midi_music.c  .generated_files/flags/default/62f69fdd01cf76e9570b2726fe1070741a6eb5f8 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/midi_music.o.d 
	@${RM} ${OBJECTDIR}/midi_music.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/midi_music.o.d" -o ${OBJECTDIR}/midi_music.o midi_music.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PT_display.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PT_display.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PT_display.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PT_display.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PT_display.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
