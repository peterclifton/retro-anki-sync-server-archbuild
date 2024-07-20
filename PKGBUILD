pkgname="retro-anki-sync-server"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A personal anki-sync-server"
#arch=("x86_64")
arch=("any")
depends=(
'python-beautifulsoup4'
'python-send2trash'
'python-pyaudio'
'python-requests'
'python-decorator'
'python-markdown'
'python-webob'
'python-psutil'
'python-distro'
)
makedepends=('git')
license=("custom")
source=("git+https://github.com/peterclifton/retro-anki-sync-server.git" 
	"retro-anki-sync-server.sh")

sha512sums=("SKIP"
	    "SKIP")

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/${HOME}"
    cp -a "${srcdir}/retro-anki-sync-server"    "${pkgdir}/${HOME}/.retro-anki-sync-server"
    cp "${srcdir}/retro-anki-sync-server.sh"    "${pkgdir}/usr/bin/retro-anki-sync-server"
    chmod +x "${pkgdir}/usr/bin/retro-anki-sync-server"
}

