#!/bin/bash
pushd $(mktemp -d)
  git clone git@github.braintreeps.com:cosmos/cpair.git
  ./cpair/scripts/setup-osx
popd
