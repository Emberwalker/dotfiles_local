#!/usr/bin/env zsh
#
# Homebrew codesigning script
#
# Signs important binaries from Homebrew so Little Snitch won't complain when
# those commands are run unsigned.
#

sign() {
  local -a FILES
  for f in $@; do
    if [[ -x "$f" ]]; then FILES+=("$f"); fi
  done
  #echo "?? Signing: $FILES"
  codesign --continue --sign "$CSIGN_IDENTITY" $FILES 2>/dev/null || true
}

# Usage
echo "!! This script will hammer the keychain with requests."
echo "!! It is suggested to use 'Always Allow', then use Get Info on the private"
echo "!! key in Keychain Access, go to Access Control and reset it back to Confirm"
echo "!! Before Allowing Access with no applications in Always Allow Access..."
echo "  ---------"

# Git
sign /usr/local/Cellar/git/*/{bin,libexec/git-core}/git*

# End
echo
echo ">> Done. See advice above about resetting Keychain Access."
