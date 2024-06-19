# Maintainer: Scraft161 <scraft161@gmail.com>
pkgname=scdf-dwm
pkgver=6.5
pkgrel=4
#epoch=1
pkgdesc='dwm build for SCDF'
arch=('x86_64' 'i686' 'arm' 'aarch64')
url="https://github.com/Scraft161/SCDF-dwm"
license=('MIT')
groups=('scdf-gui' 'scdf-x11')
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'imlib2' 'yajl' 'alacritty' 'dmenu')
provides=('dwm' 'scdf-dwm')
conflicts=('dwm' 'dwm-git')
source=("dwm.desktop"
	"https://dl.suckless.org/dwm/dwm-6.5.tar.gz"
	"https://dwm.suckless.org/patches/autostart/dwm-autostart-20210120-cb3f58a.diff"
	"https://dwm.suckless.org/patches/flextile/dwm-flextile-20210722-138b405.diff"
	"https://dwm.suckless.org/patches/winicon/dwm-winicon-6.3-v2.1.diff"
	"https://dwm.suckless.org/patches/ipc/dwm-ipc-20201106-f04cac6.diff"
	"https://dwm.suckless.org/patches/xresources/dwm-xresources-20210827-138b405.diff")
	#"https://dwm.suckless.org/patches/pango/dwm-pango-6.0.diff")
sha256sums=('cbd37e9060cd9ed71ce16f78f092a02ee9226d97c0efaba6330a092e6590a324'
	'21d79ebfa9f2fb93141836c2666cb81f4784c69d64e7f1b2352f9b970ba09729'
	'd78711587e6d554de5dc47adca00fc1eb6c8f8ca11c9e75411da8da60eae7abe'
	'8fa6086704a73005141fcad09554f05df60816896114c44a60cfcf868614ae00'
	'887362329b2eab52c9a41bd575061423d28b68febc7a4aef001bdbba9358f7b9'
	'497f2ebf639c3eeba28ce21f73b7efd2ef2fc045466e43523231094472112da1'
	'38b027743ef43b7d06f49eda7bec2bf5641c7e1575ec46c02f0e915010302c26')

prepare() {
	#cd "$srcdir/dwm-6.3"
	echo "Patching dwm"
	cd "$srcdir/.."
	./patch.sh
}

build() {
	cd "$srcdir/dwm-6.5"
	echo "Applying config"
#	rm config.h
	cp config.def.h config.h
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd "$srcdir/dwm-6.5"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licences/$pkgname/LICENSE"
	install -Dm644 "$srcdir/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}
