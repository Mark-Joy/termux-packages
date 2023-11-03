TERMUX_PKG_HOMEPAGE=https://github.com/scop/bash-completion
TERMUX_PKG_DESCRIPTION="Programmable completion for the bash shell"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.11
TERMUX_PKG_REVISION=99
TERMUX_PKG_SRCURL=git+https://github.com/Mark-Joy/bash-completion
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_SHA256=SKIP_CHECKSUM
#TERMUX_PKG_SRCURL=https://github.com/scop/bash-completion/releases/download/${TERMUX_PKG_VERSION}/bash-completion-${TERMUX_PKG_VERSION}.tar.xz
#TERMUX_PKG_SHA256=73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="bash"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_RM_AFTER_INSTALL="
share/bash-completion/completions/makepkg
"

# From bash-completion: if not installing from prepared release tarball
termux_step_pre_configure() {
  autoreconf -i
  return
}
