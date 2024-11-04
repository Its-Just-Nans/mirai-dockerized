#!/bin/sh

cd /etc/xcompile || exit 1

echo "Copy cross-compiler-armv4l.tar.gz to /etc/xcompile"
cp cross-compiler-armv4l.tar.gz /etc/xcompile/cross-compiler-armv4l.tar.gz
echo "Copy cross-compiler-armv5l.tar.gz to /etc/xcompile"
cp cross-compiler-armv5l.tar.gz /etc/xcompile/cross-compiler-armv5l.tar.gz
echo "Copy cross-compiler-armv6l.tar.gz to /etc/xcompile"
cp cross-compiler-armv6l.tar.gz /etc/xcompile/cross-compiler-armv6l.tar.gz
echo "Copy cross-compiler-i586.tar.gz to /etc/xcompile"
cp cross-compiler-i586.tar.gz /etc/xcompile/cross-compiler-i586.tar.gz
echo "Copy cross-compiler-m68k.tar.gz to /etc/xcompile"
cp cross-compiler-m68k.tar.gz /etc/xcompile/cross-compiler-m68k.tar.gz
echo "Copy cross-compiler-mips.tar.gz to /etc/xcompile"
cp cross-compiler-mips.tar.gz /etc/xcompile/cross-compiler-mips.tar.gz
echo "Copy cross-compiler-mipsel.tar.gz to /etc/xcompile"
cp cross-compiler-mipsel.tar.gz /etc/xcompile/cross-compiler-mipsel.tar.gz
echo "Copy cross-compiler-powerpc.tar.gz to /etc/xcompile"
cp cross-compiler-powerpc.tar.gz /etc/xcompile/cross-compiler-powerpc.tar.gz
echo "Copy cross-compiler-sh4.tar.gz to /etc/xcompile"
cp cross-compiler-sh4.tar.gz /etc/xcompile/cross-compiler-sh4.tar.gz
echo "Copy cross-compiler-sparc.tar.gz to /etc/xcompile"
cp cross-compiler-sparc.tar.gz /etc/xcompile/cross-compiler-sparc.tar.gz

echo "extracting cross-compiler-armv4l.tar.gz ..."
tar -xvf cross-compiler-armv4l.tar.gz
echo "extracting cross-compiler-armv5l.tar.gz ..."
tar -xvf cross-compiler-armv5l.tar.gz
echo "extracting cross-compiler-armv6l.tar.gz ..."
tar -xvf cross-compiler-armv6l.tar.gz
echo "extracting cross-compiler-i586.tar.gz ..."
tar -xvf cross-compiler-i586.tar.gz
echo "extracting cross-compiler-m68k.tar.gz ..."
tar -xvf cross-compiler-m68k.tar.gz
echo "extracting cross-compiler-mips.tar.gz ..."
tar -xvf cross-compiler-mips.tar.gz
echo "extracting cross-compiler-mipsel.tar.gz ..."
tar -xvf cross-compiler-mipsel.tar.gz
echo "extracting cross-compiler-powerpc.tar.gz ..."
tar -xvf cross-compiler-powerpc.tar.gz
echo "extracting cross-compiler-sh4.tar.gz ..."
tar -xvf cross-compiler-sh4.tar.gz
echo "extracting cross-compiler-sparc.tar.gz ..."
tar -xvf cross-compiler-sparc.tar.gz

echo "removing all tar.gz from /etc/xcompile ..."
rm *.tar.gz
echo "move cross-compiler-armv4l to armv4l ..."
mv cross-compiler-armv4l armv4l
echo "move cross-compiler-armv5l to armv5l ..."
mv cross-compiler-armv5l armv5l
echo "move cross-compiler-armv6l to armv6l ..."
mv cross-compiler-armv6l armv6l
echo "move cross-compiler-i586 to i586 ..."
mv cross-compiler-i586 i586
echo "move cross-compiler-m68k to m68k ..."
mv cross-compiler-m68k m68k
echo "move cross-compiler-mips to mips ..."
mv cross-compiler-mips mips
echo "move cross-compiler-mipsel to mipsel ..."
mv cross-compiler-mipsel mipsel
echo "move cross-compiler-powerpc to powerpc ..."
mv cross-compiler-powerpc powerpc
echo "move cross-compiler-sh4 to sh4 ..."
mv cross-compiler-sh4 sh4
echo "move cross-compiler-sparc to sparc ..."
mv cross-compiler-sparc sparc
