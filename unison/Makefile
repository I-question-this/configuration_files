################################################################################
# Name            : Makefile
# Project         : Unison
# Description     : Main Makefile
# Creation Date   : Fri May 16 14:59:49 2014
# Original Author : jharwell
# Editing Authors : Tyler Westland
#
# Note: This file is -j (parallel build) safe, provided you don't mess with it
# too much.
#
#  Products:
#  Make Target     Product                  Description
#  ===========     =======                  ===================
#  all             logs/*.logs              Run all the updates
#  clean           N/A                      Removes log directory
################################################################################

###############################################################################
# Project Name
###############################################################################
PROJECT = Project
###############################################################################
# Directory Definitions
###############################################################################
# configs/      - Root of the source tree for the project
# logs/      - Directory where all log files are built
CONFIGDIR       = ./configs
LOGDIR          = ./logs

###############################################################################
# Definitions
###############################################################################

# Tell make we want to execute all commands using bash (otherwise it uses
# sh). make generally works best with bash, and as SHELL is inherited from the
# invoking shell when make is run, it may have a value like sh, tcsh, etc. If
# you don't do this, then some shell commands will not behave as you
# expect. This is in keeping with the principle of least surprise.
SHELL           = bash

###############################################################################
# C++ Compilation Options
###############################################################################
define FLAGS
-auto -batch
endef

# Define the compiler to use
BACKUP         = unison

###############################################################################
# Functions
###############################################################################
# Recursive wildcard: search a list of directories for all files that match a pattern
# usage: $(call rwildcard, $(DIRS1) $(DIRS2) ..., pattern)
#
# All directory lists passed as first arg must be separated by spaces, and they
# themselves must be space separated as well. There must NOT be a space between
# the last dir list the , and the start of the pattern.
#
# You should never need to modify this.
# usage: $(call rwildcard, $(DIRS1) $(DIRS2) ..., pattern)
rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2)  $(filter $(subst *,%,$2),$d))

# make-depend: generate dependencies for C++ source files dynamically. Very useful
# for including .h files as target dependencies.
# usage: $(call make-depend,source-file,logsect-file,depend-file)
#
# You should never need to modify this.
# usage: $(call make-depend,source-file,logsect-file,depend-file)
make-depend-cxx=$(BACKUP) -MM -MF $3 -MP -MT $2 $(FLAGS) $1

###############################################################################
# Target Definitions
###############################################################################
# Define what directories to search for source code. For us, this will just
# be a single source directory, configs/.
CONFIG_DIRS = $(CONFIGDIR)

# Define the list of files to compile for this project, which is built by
# recursively finding all .cc files in configs/.
CONFIGS = $(call rwildcard,$(CONFIG_DIRS),*.prf)

# For each of the .cc files found under configs/, determine the name of the
# corresponding .o file to create in logs/ via pattern substitution (patsust).
LOGS = $(notdir $(patsubst %.prf,%.log,$(CONFIGS)))

###############################################################################
# All targets
###############################################################################

# Phony targets: targets of this type will be run everytime by make (i.e. make
# does not assume that the target recipe will build the target name)
.PHONY: clean veryclean all

# The default target which will be run if the user just types "make" with a
# target name
all: $(addprefix $(LOGDIR)/, $(LOGS)) | $(LOGDIR)

# The Objectifier. This rule says that each .log file in logs/, depends on the
# presence of the logs/ directory. This is necessary so that parallel make
# (make -j) works.
$(addprefix $(LOGDIR)/, $(LOGS)): | $(LOGDIR)

# Bootstrap Bill. This creates all of the order-only prerequisites; that is,
# files/directories that have to be present in order for a given target build
# to succeed, but that make knows do not need to be remade each time their
# modification time is updated and they are newer than the target being built.
$(LOGDIR):
	@mkdir -p $@

# The Cleaner. Clean up the project, by removing ALL files generated during
# the build process to build the main target.
clean:
	@rm -rf $(LOGDIR)

###############################################################################
# Pattern Rules
###############################################################################
# For compiling the C++ source. Specify that any .o file in logs/ can be built
# from any .cc file in configs/. Before doing compilation, emit (possibly) make
# rules for the includes for the .cc file, as they may have changed since the
# last invocation of make.
$(LOGDIR)/%.log: $(CONFIGDIR)/%.prf
	$(BACKUP) $(FLAGS) $< > $@ 

