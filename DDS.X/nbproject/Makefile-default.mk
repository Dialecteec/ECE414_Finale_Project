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
SOURCEFILES_QUOTED_IF_SPACED=../DDS_Example/dac4822.c ../DDS_Example/dds.c ../DDS_Example/dds_test.c ../DDS_Example/past_lab_songs.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/27158769/dac4822.o ${OBJECTDIR}/_ext/27158769/dds.o ${OBJECTDIR}/_ext/27158769/dds_test.o ${OBJECTDIR}/_ext/27158769/past_lab_songs.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/27158769/dac4822.o.d ${OBJECTDIR}/_ext/27158769/dds.o.d ${OBJECTDIR}/_ext/27158769/dds_test.o.d ${OBJECTDIR}/_ext/27158769/past_lab_songs.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/27158769/dac4822.o ${OBJECTDIR}/_ext/27158769/dds.o ${OBJECTDIR}/_ext/27158769/dds_test.o ${OBJECTDIR}/_ext/27158769/past_lab_songs.o

# Source Files
SOURCEFILES=../DDS_Example/dac4822.c ../DDS_Example/dds.c ../DDS_Example/dds_test.c ../DDS_Example/past_lab_songs.c



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
${OBJECTDIR}/_ext/27158769/dac4822.o: ../DDS_Example/dac4822.c  .generated_files/flags/default/aa8832264dceda75a0e7184857b55b949e820c69 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/_ext/27158769" 
	@${RM} ${OBJECTDIR}/_ext/27158769/dac4822.o.d 
	@${RM} ${OBJECTDIR}/_ext/27158769/dac4822.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/27158769/dac4822.o.d" -o ${OBJECTDIR}/_ext/27158769/dac4822.o ../DDS_Example/dac4822.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/27158769/dds.o: ../DDS_Example/dds.c  .generated_files/flags/default/bb59c041a10306382cd7745baff9375abbe1962f .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/_ext/27158769" 
	@${RM} ${OBJECTDIR}/_ext/27158769/dds.o.d 
	@${RM} ${OBJECTDIR}/_ext/27158769/dds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/27158769/dds.o.d" -o ${OBJECTDIR}/_ext/27158769/dds.o ../DDS_Example/dds.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/27158769/dds_test.o: ../DDS_Example/dds_test.c  .generated_files/flags/default/2d38c5762287f19a3ade3a6fcd5cd2d9a4e67409 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/_ext/27158769" 
	@${RM} ${OBJECTDIR}/_ext/27158769/dds_test.o.d 
	@${RM} ${OBJECTDIR}/_ext/27158769/dds_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/27158769/dds_test.o.d" -o ${OBJECTDIR}/_ext/27158769/dds_test.o ../DDS_Example/dds_test.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/27158769/past_lab_songs.o: ../DDS_Example/past_lab_songs.c  .generated_files/flags/default/f2a4cd457c94ab4ea088b4cc8a3c3f6018040610 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/_ext/27158769" 
	@${RM} ${OBJECTDIR}/_ext/27158769/past_lab_songs.o.d 
	@${RM} ${OBJECTDIR}/_ext/27158769/past_lab_songs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/27158769/past_lab_songs.o.d" -o ${OBJECTDIR}/_ext/27158769/past_lab_songs.o ../DDS_Example/past_lab_songs.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/_ext/27158769/dac4822.o: ../DDS_Example/dac4822.c  .generated_files/flags/default/2cdd9b20ae0b2535a3c15410b60540b7eee4a8aa .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/_ext/27158769" 
	@${RM} ${OBJECTDIR}/_ext/27158769/dac4822.o.d 
	@${RM} ${OBJECTDIR}/_ext/27158769/dac4822.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/27158769/dac4822.o.d" -o ${OBJECTDIR}/_ext/27158769/dac4822.o ../DDS_Example/dac4822.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/27158769/dds.o: ../DDS_Example/dds.c  .generated_files/flags/default/ccff5aa08621df1ad9e23ede6e5f93c903e4969 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/_ext/27158769" 
	@${RM} ${OBJECTDIR}/_ext/27158769/dds.o.d 
	@${RM} ${OBJECTDIR}/_ext/27158769/dds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/27158769/dds.o.d" -o ${OBJECTDIR}/_ext/27158769/dds.o ../DDS_Example/dds.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/27158769/dds_test.o: ../DDS_Example/dds_test.c  .generated_files/flags/default/d39384961f2a56d3f4d34038ac813f4dc39d4440 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/_ext/27158769" 
	@${RM} ${OBJECTDIR}/_ext/27158769/dds_test.o.d 
	@${RM} ${OBJECTDIR}/_ext/27158769/dds_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/27158769/dds_test.o.d" -o ${OBJECTDIR}/_ext/27158769/dds_test.o ../DDS_Example/dds_test.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/27158769/past_lab_songs.o: ../DDS_Example/past_lab_songs.c  .generated_files/flags/default/44619a1941d8de73a6aaa12955a873ecd8ce36e2 .generated_files/flags/default/f309b13ca19d94482b4e88f062e68a25e5ea6efd
	@${MKDIR} "${OBJECTDIR}/_ext/27158769" 
	@${RM} ${OBJECTDIR}/_ext/27158769/past_lab_songs.o.d 
	@${RM} ${OBJECTDIR}/_ext/27158769/past_lab_songs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/27158769/past_lab_songs.o.d" -o ${OBJECTDIR}/_ext/27158769/past_lab_songs.o ../DDS_Example/past_lab_songs.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
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
