#!/bin/bash
#--------------------------------------------------------------------
# File: klayout.sh
#
# Description: Start up script for KLayout 0.25 or later
#
# By K. Sekigawa
# Last modified: 2021/10/23
#--------------------------------------------------------------------
SCRIPT_DIR=$(cd $(dirname $(readlink -f $0 || echo $0));pwd -P)

KLAYOUT_LIBS=$SCRIPT_DIR
KLAYOUT_EXE=$SCRIPT_DIR/klayout
RLATED_LIBS=/usr/local/lib


export QT_FONT_DPI=120
export PYTHONHOME=$HOME/anaconda3
export PYTHONPATH=$HOME/anaconda3

export ESCHMOD_PATH=$HOME/Study/ESCHeaterModeler/eschmod/bin-rel64

export LD_LIBRARY_PATH=$KLAYOUT_LIBS:$RLATED_LIBS:$LD_LIBRARY_PATH
eval "$KLAYOUT_EXE -style=fusion $*"

#---------------
# End of File
#---------------
