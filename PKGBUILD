# Maintainer: pizero <zhaory200707@outlook.com>

pkgname='classwidgets-weekly'
pkgver=rolling
pkgrel=1
pkgdesc='Class Widgets 是一款能够显示当前课程的桌面组件应用程序。其提供了易用课程表编辑和美观的桌面组件。（周一凌晨构建版）'
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
source=("classwidgets-weekly.desktop" "classwidgets-weekly.sh" "$pkgname-$pkgver.zip::$_url")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    # setup dir
    install -dm777 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/var/log/$pkgname"
    install -dm777 "$pkgdir/etc/$pkgname"

    # copy file
    cp -r $srcdir/* "$pkgdir/opt/$pkgname"
    mv $pkgdir/opt/$pkgname/config/* "$pkgdir/etc/$pkgname"
    install -Dm755 "$srcdir/classwidgets-weekly.sh" \
        "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/classwidgets-weekly.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/img/Logo.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/img/Logo.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

    # link dir
    rm -r "$pkgdir/opt/$pkgname/config"
    ln -sf "$pkgdir/var/log/$pkgname" "$pkgdir/opt/$pkgname/log"
    ln -sf $pkgdir/etc/$pkgname "$pkgdir/opt/$pkgname/config"
    chmod a=rwx -R $pkgdir/etc/$pkgname
}
