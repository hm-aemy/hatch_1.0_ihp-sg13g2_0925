#!/bin/bash -e

git -C /opt/librelane fetch origin
git -C /opt/librelane checkout leo/padring
git -C /opt/librelane pull

nix-shell --pure /opt/librelane --run "PDK_ROOT=${PWD}/pdk PDK=ihp-sg13g2 librelane --manual-pdk --run-tag croc_pl_60_2100 --overwrite config.json"