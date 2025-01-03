# Maintainer: pizero <zhaory200707@outlook.com>

pkgname='classwidgets-nightly'
pkgver=rolling
pkgrel=1
pkgdesc='Class Widgets 是一款能够显示当前课程的桌面组件应用程序。其提供了易用课程表编辑和美观的桌面组件。'
arch=('x86_64')
url="https://github.com/Class-Widgets/Class-Widgets"
_url="https://nightly.link/Class-Widgets/Class-Widgets/workflows/build/main/ubuntu-20.04-x64.zip"
license=('GPL3')
depends=(
    'libjpeg-turbo' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libgl' 'fontconfig' 'xdg-utils'
    'shared-mime-info' 'xcb-util-wm' 'libxrender' 'libxi' 'sqlite' 'xcb-util-image' 'mesa'
    'tslib' 'libinput' 'libxkbcommon-x11' 'libproxy' 'libcups' 'double-conversion' 'md4c'
)
checkdepends=()
source=("classwidgets-nightly.desktop" "classwidgets-nightly.sh" "$pkgname-$pkgver.zip::$_url")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    cp -r $srcdir/* "$pkgdir/opt/$pkgname"
    install -Dm755 "$srcdir/classwidgets-nightly.sh" \
        "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/classwidgets-nightly.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/img/Logo.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/img/Logo.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"1
}
