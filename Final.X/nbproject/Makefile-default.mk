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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Final.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Final.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=Adafruit_2_4_LCD_Serial_Library/glcdfont.c Adafruit_2_4_LCD_Serial_Library/tft_gfx.c Adafruit_2_4_LCD_Serial_Library/tft_master.c DDS/dac4822.c DDS/dds.c DDS/dds_test.c PlayFunc.c protothread.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o ${OBJECTDIR}/DDS/dac4822.o ${OBJECTDIR}/DDS/dds.o ${OBJECTDIR}/DDS/dds_test.o ${OBJECTDIR}/PlayFunc.o ${OBJECTDIR}/protothread.o
POSSIBLE_DEPFILES=${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o.d ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o.d ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o.d ${OBJECTDIR}/DDS/dac4822.o.d ${OBJECTDIR}/DDS/dds.o.d ${OBJECTDIR}/DDS/dds_test.o.d ${OBJECTDIR}/PlayFunc.o.d ${OBJECTDIR}/protothread.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o ${OBJECTDIR}/DDS/dac4822.o ${OBJECTDIR}/DDS/dds.o ${OBJECTDIR}/DDS/dds_test.o ${OBJECTDIR}/PlayFunc.o ${OBJECTDIR}/protothread.o

# Source Files
SOURCEFILES=Adafruit_2_4_LCD_Serial_Library/glcdfont.c Adafruit_2_4_LCD_Serial_Library/tft_gfx.c Adafruit_2_4_LCD_Serial_Library/tft_master.c DDS/dac4822.c DDS/dds.c DDS/dds_test.c PlayFunc.c protothread.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Final.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX150F128B
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
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o: Adafruit_2_4_LCD_Serial_Library/glcdfont.c  .generated_files/flags/default/2c80e0859e12babc4b27d2bedcad51cc7c298330 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o Adafruit_2_4_LCD_Serial_Library/glcdfont.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o: Adafruit_2_4_LCD_Serial_Library/tft_gfx.c  .generated_files/flags/default/c93e261d7bb6285c2ca0f9da97ae471e47aab73f .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o Adafruit_2_4_LCD_Serial_Library/tft_gfx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o: Adafruit_2_4_LCD_Serial_Library/tft_master.c  .generated_files/flags/default/6e36a747f02d6eab645ef671167a716991738a9c .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o Adafruit_2_4_LCD_Serial_Library/tft_master.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/DDS/dac4822.o: DDS/dac4822.c  .generated_files/flags/default/dcc15f0a23e11dd5b888a46efd3304e3fac795d1 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/DDS" 
	@${RM} ${OBJECTDIR}/DDS/dac4822.o.d 
	@${RM} ${OBJECTDIR}/DDS/dac4822.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/DDS/dac4822.o.d" -o ${OBJECTDIR}/DDS/dac4822.o DDS/dac4822.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/DDS/dds.o: DDS/dds.c  .generated_files/flags/default/8588f75884dd704c8be814d84151625f06a15a97 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/DDS" 
	@${RM} ${OBJECTDIR}/DDS/dds.o.d 
	@${RM} ${OBJECTDIR}/DDS/dds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/DDS/dds.o.d" -o ${OBJECTDIR}/DDS/dds.o DDS/dds.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/DDS/dds_test.o: DDS/dds_test.c  .generated_files/flags/default/ac502244d01bd42157d4440548cf5560c63cc344 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/DDS" 
	@${RM} ${OBJECTDIR}/DDS/dds_test.o.d 
	@${RM} ${OBJECTDIR}/DDS/dds_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/DDS/dds_test.o.d" -o ${OBJECTDIR}/DDS/dds_test.o DDS/dds_test.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/PlayFunc.o: PlayFunc.c  .generated_files/flags/default/1deca274e7134bd27690e8f3f5e4fc92e17504a6 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PlayFunc.o.d 
	@${RM} ${OBJECTDIR}/PlayFunc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/PlayFunc.o.d" -o ${OBJECTDIR}/PlayFunc.o PlayFunc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/protothread.o: protothread.c  .generated_files/flags/default/f0c89d938968348dbd44bbb01b7f4e2c6183a0c2 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/protothread.o.d 
	@${RM} ${OBJECTDIR}/protothread.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/protothread.o.d" -o ${OBJECTDIR}/protothread.o protothread.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o: Adafruit_2_4_LCD_Serial_Library/glcdfont.c  .generated_files/flags/default/2644a23f7e4da2bdb708879fa2dc8bcc37f50415 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/glcdfont.o Adafruit_2_4_LCD_Serial_Library/glcdfont.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o: Adafruit_2_4_LCD_Serial_Library/tft_gfx.c  .generated_files/flags/default/e1d43d9bd3bf3ee0eab545c99c6d9706fa6d015f .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_gfx.o Adafruit_2_4_LCD_Serial_Library/tft_gfx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o: Adafruit_2_4_LCD_Serial_Library/tft_master.c  .generated_files/flags/default/7a2a72ffc9da279261ae2771eaed4b336a5a5dd5 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library" 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o.d 
	@${RM} ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o.d" -o ${OBJECTDIR}/Adafruit_2_4_LCD_Serial_Library/tft_master.o Adafruit_2_4_LCD_Serial_Library/tft_master.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/DDS/dac4822.o: DDS/dac4822.c  .generated_files/flags/default/9fce48b85e62cfd7266c218d83d3239031c14f59 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/DDS" 
	@${RM} ${OBJECTDIR}/DDS/dac4822.o.d 
	@${RM} ${OBJECTDIR}/DDS/dac4822.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/DDS/dac4822.o.d" -o ${OBJECTDIR}/DDS/dac4822.o DDS/dac4822.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/DDS/dds.o: DDS/dds.c  .generated_files/flags/default/7d84d7749b5d18c10457a98a4cbcfc7564c014de .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/DDS" 
	@${RM} ${OBJECTDIR}/DDS/dds.o.d 
	@${RM} ${OBJECTDIR}/DDS/dds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/DDS/dds.o.d" -o ${OBJECTDIR}/DDS/dds.o DDS/dds.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/DDS/dds_test.o: DDS/dds_test.c  .generated_files/flags/default/6e96ae3deb6b0109e08e192fea25bd199b0b3443 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}/DDS" 
	@${RM} ${OBJECTDIR}/DDS/dds_test.o.d 
	@${RM} ${OBJECTDIR}/DDS/dds_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/DDS/dds_test.o.d" -o ${OBJECTDIR}/DDS/dds_test.o DDS/dds_test.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/PlayFunc.o: PlayFunc.c  .generated_files/flags/default/192c60bbbc4cd9c1a442ed600bb4c7f8ea8072fe .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PlayFunc.o.d 
	@${RM} ${OBJECTDIR}/PlayFunc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/PlayFunc.o.d" -o ${OBJECTDIR}/PlayFunc.o PlayFunc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/protothread.o: protothread.c  .generated_files/flags/default/8a508d9445bd2e233ba0e0b7459c210ab50b4365 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/protothread.o.d 
	@${RM} ${OBJECTDIR}/protothread.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/protothread.o.d" -o ${OBJECTDIR}/protothread.o protothread.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Final.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Final.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Final.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Final.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Final.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
