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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/DDS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/DDS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=dac4822.c dds.c dds_test.c songs.c midi_music.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/dac4822.o ${OBJECTDIR}/dds.o ${OBJECTDIR}/dds_test.o ${OBJECTDIR}/songs.o ${OBJECTDIR}/midi_music.o
POSSIBLE_DEPFILES=${OBJECTDIR}/dac4822.o.d ${OBJECTDIR}/dds.o.d ${OBJECTDIR}/dds_test.o.d ${OBJECTDIR}/songs.o.d ${OBJECTDIR}/midi_music.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/dac4822.o ${OBJECTDIR}/dds.o ${OBJECTDIR}/dds_test.o ${OBJECTDIR}/songs.o ${OBJECTDIR}/midi_music.o

# Source Files
SOURCEFILES=dac4822.c dds.c dds_test.c songs.c midi_music.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/DDS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/dac4822.o: dac4822.c  .generated_files/flags/default/fa9262c9c944546476e029b47ca0df8a1729a653 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dac4822.o.d 
	@${RM} ${OBJECTDIR}/dac4822.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dac4822.o.d" -o ${OBJECTDIR}/dac4822.o dac4822.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/dds.o: dds.c  .generated_files/flags/default/182051acd04bd7ddad9ef1a93d754a1de56a15ee .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dds.o.d 
	@${RM} ${OBJECTDIR}/dds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dds.o.d" -o ${OBJECTDIR}/dds.o dds.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/dds_test.o: dds_test.c  .generated_files/flags/default/bdf9f7c515601d1c3f58fd43022f64fd7835d4f6 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dds_test.o.d 
	@${RM} ${OBJECTDIR}/dds_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dds_test.o.d" -o ${OBJECTDIR}/dds_test.o dds_test.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/songs.o: songs.c  .generated_files/flags/default/4133c4548a1bdcb72e57027e5337526e90ceecc .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/songs.o.d 
	@${RM} ${OBJECTDIR}/songs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/songs.o.d" -o ${OBJECTDIR}/songs.o songs.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/midi_music.o: midi_music.c  .generated_files/flags/default/44193d4d21d5c8e17781caec1104767dc1388215 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/midi_music.o.d 
	@${RM} ${OBJECTDIR}/midi_music.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/midi_music.o.d" -o ${OBJECTDIR}/midi_music.o midi_music.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/dac4822.o: dac4822.c  .generated_files/flags/default/ee83299c88b102deb2c49503201ccf06a1760cf3 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dac4822.o.d 
	@${RM} ${OBJECTDIR}/dac4822.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dac4822.o.d" -o ${OBJECTDIR}/dac4822.o dac4822.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/dds.o: dds.c  .generated_files/flags/default/fb40cf14ba9649b175656dfab0b98fa000c05896 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dds.o.d 
	@${RM} ${OBJECTDIR}/dds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dds.o.d" -o ${OBJECTDIR}/dds.o dds.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/dds_test.o: dds_test.c  .generated_files/flags/default/cf441a500ac55564f665afffc9aeef9954c69b59 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dds_test.o.d 
	@${RM} ${OBJECTDIR}/dds_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dds_test.o.d" -o ${OBJECTDIR}/dds_test.o dds_test.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/songs.o: songs.c  .generated_files/flags/default/2bab25c35532f32743d590ee794236a1804901c3 .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/songs.o.d 
	@${RM} ${OBJECTDIR}/songs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/songs.o.d" -o ${OBJECTDIR}/songs.o songs.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/midi_music.o: midi_music.c  .generated_files/flags/default/f070caafc71d92d88c0137607166ebf02e58634b .generated_files/flags/default/c9ab9a848ec860c15d50c34be9dd107a6274ab00
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
dist/${CND_CONF}/${IMAGE_TYPE}/DDS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/DDS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/DDS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/DDS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/DDS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
