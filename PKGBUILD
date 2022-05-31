# Maintainer: Scraft161 <scraft161@gmail.com>
pkgname=scdf-dwm
pkgver=6.3
pkgrel=1
epoch=1
pkgdesc='dwm build for SCDF'
arch=('x86_64' 'i686' 'arm' 'aarch64')
url="https://github.com/Scraft161/SCDF-dwm"
license=('MIT')
groups=('scdf-gui' 'scdf-x11')
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'alacritty' 'dmenu')
provides=('dwm' 'scdf-dwm')
conflicts=('dwm' 'dwm-git')
source=("dwm.desktop"
	"https://dl.suckless.org/dwm/dwm-6.1.tar.gz"
	"https://dwm.suckless.org/patches/autostart/dwm-autostart-20210120-cb3f58a.diff"
	"https://dwm.suckless.org/patches/flextile/dwm-flextile-20210722-138b405.diff")
sha256sums=('cbd37e9060cd9ed71ce16f78f092a02ee9226d97c0efaba6330a092e6590a324'
	'c2f6c56167f0acdbe3dc37cca9c1a19260c040f2d4800e3529a21ad7cce275fe'
	'd78711587e6d554de5dc47adca00fc1eb6c8f8ca11c9e75411da8da60eae7abe'
	'8fa6086704a73005141fcad09554f05df60816896114c44a60cfcf868614ae00')

prepare() {
	cd "$srcdir/dwm-6.1"
	echo "$srcdir"
	echo "Patching dwm"
	patch -i "../../dwm-autostart-modified.diff"
	patch -i "../../dwm-flextile-modified.diff"
	pwd
	ls -A
}

build() {
	cd "$srcdir/dwm-6.1"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd "$srcdir/dwm-6.1"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licences/$pkgname/LICENSE"
	install -Dm644 "$srcdir/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}
