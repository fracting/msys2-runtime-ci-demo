# Maintainer: Alexey Pavlov <alexpux@gmail.com>
# Contributor: Ray Donnelly <mingw.android@gmail.com>

pkgname=('msys2-runtime' 'msys2-runtime-devel')
_ver_base=2.1.0
pkgver=r32585
pkgrel=1
pkgdesc="Cygwin POSIX emulation engine"
arch=('i686' 'x86_64')
url=""
license=('GPL')
groups=('base')
depends=()
makedepends=('cocom'
             'perl'
             'gcc'
             'svn'
             'make'
             'mingw-w64-cross-gcc'
             'mingw-w64-cross-zlib'
             'zlib-devel'
             'gettext-devel'
             'libiconv-devel'
             'diffutils')
options=('debug' '!strip')
source=('msys2-runtime'::'svn+https://github.com/Alexpux/Cygwin/branches/msys2-master')
#source=('https://github.com/Alexpux/Cygwin/archive/msys2-master.zip')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/msys2-runtime"
  #printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #printf "%s.%s.%s" "${_ver_base}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  printf "r%s" "$(svnversion | tr -d 'A-z')"
  #echo test
}

prepare() {
  cd "${srcdir}/msys2-runtime"
  #unzip ${srcdir}/msys2-master.zip -d $srcdir || true
  #mv ${srcdir}/Cygwin-msys2-master ${srcdir}/msys2-runtime
}

build() {
  [[ -d $srcdir/build-${CHOST} ]] && rm -rf $srcdir/build-${CHOST}
  mkdir -p $srcdir/build-${CHOST} && cd $srcdir/build-${CHOST}

  # Gives more verbose compile output when debugging.
  if check_option "debug" "y"; then
    export CCWRAP_VERBOSE=1
    OPTIM="-O0"
  else
    OPTIM="-O2"
  fi

  CFLAGS="$OPTIM -pipe -ggdb"
  CXXFLAGS="$OPTIM -pipe -ggdb"

  ${srcdir}/msys2-runtime/configure \
    --prefix=/usr \
    --build=${CHOST} \
    --sysconfdir=/etc
  LC_ALL=C make
  LC_ALL=C make -j1 DESTDIR=${srcdir}/dest install

  #pushd ${CHOST}/winsup/cygwin > /dev/null
  #LANG=C make libmsys2_s.a
  #cp libmsys2_s.a ${srcdir}/dest/usr/${CHOST}/lib/
  #popd > /dev/null

  rm -rf ${srcdir}/dest/etc
}

package_msys2-runtime() {
  pkgdesc="Posix emulation engine for Windows"
  groups=('base')
  options=('!strip')
  #install=msys2-runtime.install

  mkdir -p $pkgdir/usr
  cp -rf ${srcdir}/dest/usr/bin $pkgdir/usr/
  rm -f $pkgdir/usr/bin/msys-2.0.dbg
  rm -f $pkgdir/usr/bin/cyglsa-config
  rm -f $pkgdir/usr/bin/cyglsa.dll
  rm -f $pkgdir/usr/bin/cyglsa64.dll
  rm -f $pkgdir/usr/bin/cygserver-config
  cp -rf ${srcdir}/dest/usr/share $pkgdir/usr/
}

package_msys2-runtime-devel() {
  pkgdesc="MSYS2 headers and libraries"
  groups=('MSYS2-devel')
  depends=("msys2-runtime=${pkgver}")
  options=('staticlibs' '!strip')

  mkdir -p $pkgdir/usr/bin
  cp -f ${srcdir}/dest/usr/bin/msys-2.0.dbg $pkgdir/usr/bin/
  cp -rLf ${srcdir}/dest/usr/${CHOST}/include $pkgdir/usr/
  rm -f $pkgdir/usr/include/iconv.h
  rm -f $pkgdir/usr/include/unctrl.h
  # provided by libtirpc
  rm -fr $pkgdir/usr/include/rpc/

  cp -rLf ${srcdir}/dest/usr/${CHOST}/lib $pkgdir/usr/
}

# return 0
# To hack on this:
# cd /c/repo-MSYS2/msys2-runtime/
# pushd src/build-i686-pc-msys
# LANG=C make && make -j1 DESTDIR=/c/repo-MSYS2/msys2-runtime/src/dest install
# popd
# makepkg -sRLf
# pacman -U msys2-runtime*.xz

# Quicker:
# open cmd.exe
# set "PATH=C:\\msys32\\usr\\bin;%PATH%"
# E:
# pushd E:\m2\repo-MSYS2\msys2-runtime\src\build-i686-pc-msys\i686-pc-msys\winsup\cygwin
# C:/msys32/usr/bin/bash -c "LANG=C && make"
# copy /y new-msys-2.0.dll C:\msys32\usr\bin\msys-2.0.dll
# popd
# C:
# C:/msys32/usr/bin/strace ls / > C:/strace.txt 2>&1
#
