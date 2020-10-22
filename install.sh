#!/bin/bash
pushd $(mktemp -d)
  git clone git@github.braintreeps.com:cosmos/cpair.git
  ./cpair/scripts/setup-osx
  # clone
  git clone https://github.com/powerline/fonts.git --depth=1
  # install
  cd fonts
  ./install.sh
  # clean-up a bit
  cd ..
  rm -rf fonts
  brew tap saulpw/vd
popd
