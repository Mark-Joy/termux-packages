TERMUX_PKG_HOMEPAGE=https://github.com/knqyf263/pet
TERMUX_PKG_DESCRIPTION="Simple command-line snippet manager"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.6.1"
TERMUX_PKG_SRCURL=https://github.com/knqyf263/pet/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=b64bd34239955d5ef74a081d59fdc43dbc98fdcac45f84e863123496be1fe036
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS="fzf"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_golang

	go mod init || :
	go mod tidy
}

termux_step_make() {
	go build -o pet -ldflags="-s -w -X 'github.com/knqyf263/pet/cmd.version=${TERMUX_PKG_VERSION}'"
}

termux_step_make_install() {
	install -Dm700 -t "${TERMUX_PREFIX}"/bin "$TERMUX_PKG_SRCDIR"/pet
}
