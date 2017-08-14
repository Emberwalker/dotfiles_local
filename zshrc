#
# zsh host-specific profile
#

# iTerm 2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Minikube
alias mkstart="minikube start --vm-driver=xhyve"
alias mkstop="minikube stop"
alias mkdash="minikube dashboard"

# Codesigning
# This can be used on brew-built binaries to sign them with a trusted signature
# so tools like Little Snitch won't whine about them being invoked via iTerm.
# Based on: https://sourceware.org/gdb/wiki/BuildingOnDarwin
# e.g.: csign /usr/local/bin/curl
export CSIGN_IDENTITY="(Astraeus Codesign)"
alias csign="codesign -s \"$CSIGN_IDENTITY\""
