#!/bin/bash
#-----------------------------------------------------------------------------------------------------
# Sub. Build klayout inside conda environment
#
# Posted by: Grandement
#        on: 2022-03-04
#
# Ref. https://www.klayout.de/forum/discussion/2043/build-klayout-inside-conda-environment
#-----------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# [1] Receive only "-dry-run" or "-h" option
#-------------------------------------------------------------------------------
dryRun=""
help=""
if [ $# -eq 1 ]; then
	if [ "$1" = "-dry-run" ]; then
		dryRun=$1
	elif [ "$1" = "-h" ]; then
		help=$1
	fi
fi

#-------------------------------------------------------------------------------
# [2] Set the parameters
#-------------------------------------------------------------------------------
bashKL="./build.sh"
pythonLib="$HOME/anaconda3/lib/libpython3.9.so"
buildDir="test1-build-release"
binDir="test1-bin-release"
buildOp="-j4"
buildLog="test1-build-release.log"

#-------------------------------------------------------------------------------
# [3] Export environment variables for the Expert Build
#
#      if [ $BUILD_EXPERT = 1 ]; then
#        qmake_options+=(
#          QMAKE_AR="$AR cqs"
#          QMAKE_LINK_C="$CC"
#          QMAKE_LINK_C_SHLIB="$CC"
#          QMAKE_LINK="$CXX"
#          QMAKE_LINK_SHLIB="$CXX"
#          QMAKE_OBJCOPY="$OBJCOPY"
#          QMAKE_RANLIB=
#          QMAKE_STRIP=
#          QMAKE_CC="$CC"
#          QMAKE_CXX="$CXX"
#          QMAKE_CFLAGS="$CFLAGS"
#          QMAKE_CFLAGS_RELEASE=
#          QMAKE_CFLAGS_DEBUG=
#          QMAKE_CXXFLAGS="$CXXFLAGS"
#          QMAKE_CXXFLAGS_RELEASE=
#          QMAKE_CXXFLAGS_DEBUG=
#          QMAKE_LIBS="$LIBS"
#          QMAKE_LFLAGS="$LDFLAGS"
#          QMAKE_LFLAGS_RELEASE=
#          QMAKE_LFLAGS_DEBUG=
#        )
#      fi
#-------------------------------------------------------------------------------
# These values are not set in "ana3B-1.sh". That is, non-expert mode.

#-------------------------------------------------------------------------------
# [4] Construct the command line and evaluate it
#-------------------------------------------------------------------------------
buildCmd="time $bashKL -build $buildDir -prefix $binDir -bin $binDir -pylib $pythonLib"
buildCmd="$buildCmd -option $buildOp $dryRun $help 2>&1 | tee $buildLog"

eval $buildCmd

# EOF
