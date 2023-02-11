cd /etc/xcompile

echo "Copy cross-compiler-armv4l.tar.bz2 to /etc/xcompile"
cp cross-compiler-armv4l.tar.bz2 /etc/xcompile/cross-compiler-armv4l.tar.bz2
echo "Copy cross-compiler-armv5l.tar.bz2 to /etc/xcompile"
cp cross-compiler-armv5l.tar.bz2 /etc/xcompile/cross-compiler-armv5l.tar.bz2
echo "Copy cross-compiler-armv6l.tar.bz2 to /etc/xcompile"
cp cross-compiler-armv6l.tar.bz2 /etc/xcompile/cross-compiler-armv6l.tar.bz2
echo "Copy cross-compiler-i586.tar.bz2 to /etc/xcompile"
cp cross-compiler-i586.tar.bz2 /etc/xcompile/cross-compiler-i586.tar.bz2
echo "Copy cross-compiler-m68k.tar.bz2 to /etc/xcompile"
cp cross-compiler-m68k.tar.bz2 /etc/xcompile/cross-compiler-m68k.tar.bz2
echo "Copy cross-compiler-mips.tar.bz2 to /etc/xcompile"
cp cross-compiler-mips.tar.bz2 /etc/xcompile/cross-compiler-mips.tar.bz2
echo "Copy cross-compiler-mipsel.tar.bz2 to /etc/xcompile"
cp cross-compiler-mipsel.tar.bz2 /etc/xcompile/cross-compiler-mipsel.tar.bz2
echo "Copy cross-compiler-powerpc.tar.bz2 to /etc/xcompile"
cp cross-compiler-powerpc.tar.bz2 /etc/xcompile/cross-compiler-powerpc.tar.bz2
echo "Copy cross-compiler-sh4.tar.bz2 to /etc/xcompile"
cp cross-compiler-sh4.tar.bz2 /etc/xcompile/cross-compiler-sh4.tar.bz2
echo "Copy cross-compiler-sparc.tar.bz2 to /etc/xcompile"
cp cross-compiler-sparc.tar.bz2 /etc/xcompile/cross-compiler-sparc.tar.bz2


echo "extracting cross-compiler-armv4l.tar.bz2 ..."
tar -jxf cross-compiler-armv4l.tar.bz2
echo "extracting cross-compiler-armv5l.tar.bz2 ..."
tar -jxf cross-compiler-armv5l.tar.bz2
echo "extracting cross-compiler-armv6l.tar.bz2 ..."
tar -jxf cross-compiler-armv6l.tar.bz2
echo "extracting cross-compiler-i586.tar.bz2 ..."
tar -jxf cross-compiler-i586.tar.bz2
echo "extracting cross-compiler-m68k.tar.bz2 ..."
tar -jxf cross-compiler-m68k.tar.bz2
echo "extracting cross-compiler-mips.tar.bz2 ..."
tar -jxf cross-compiler-mips.tar.bz2
echo "extracting cross-compiler-mipsel.tar.bz2 ..."
tar -jxf cross-compiler-mipsel.tar.bz2
echo "extracting cross-compiler-powerpc.tar.bz2 ..."
tar -jxf cross-compiler-powerpc.tar.bz2
echo "extracting cross-compiler-sh4.tar.bz2 ..."
tar -jxf cross-compiler-sh4.tar.bz2
echo "extracting cross-compiler-sparc.tar.bz2 ..."
tar -jxf cross-compiler-sparc.tar.bz2

echo "removing all tar.bz2 from /etc/xcompile ..."
rm *.tar.bz2
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