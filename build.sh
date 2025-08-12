#!/bin/bash -e

git -C /opt/librelane fetch origin
git -C /opt/librelane checkout leo/padring
git -C /opt/librelane pull

git clone -b leo/padring https://github.com/mole99/IHP-Open-PDK.git /opt/IHP-Open-PDK-hm-aemy 2> /dev/null || git -C /opt/IHP-Open-PDK-hm-aemy pull
#git clone -b https://github.com/librelane/librelane.git /opt/librelane 2> /dev/null || git -C /opt/librelane pull

#git -C /opt/librelane checkout leo/padring
#git -C /opt/librelane pull

nix-shell --pure /opt/librelane --run "PDK_ROOT=/opt/IHP-Open-PDK-hm-aemy/ PDK=ihp-sg13g2 librelane --manual-pdk --run-tag croc_pl_60_2100 --overwrite config.json"