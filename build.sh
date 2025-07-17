#!/bin/bash -e

#ciel is not setup for ihp yet, it need to be clone directly
git clone https://github.com/IHP-GmbH/IHP-Open-PDK.git /opt/IHP-Open-PDK 2> /dev/null || git -C /opt/IHP-Open-PDK pull
# We have to use our fork branch of librelane. Just meanwhil the ihp branch of the librelane is not merge to the dev branch
git clone -b try_merge https://github.com/hm-aemy/librelane /opt/librelane-hm-aemy 2> /dev/null || git -C /opt/librelane-hm-aemy pull

git -C /opt/librelane checkout dev
git -C /opt/IHP-Open-PDK/ checkout dev

#nix-shell --pure /opt/librelane --run "librelane --run-tag hatch_1.0_ihp-sg13g2_0925 --overwrite config.json"
nix-shell --pure /opt/librelane-hm-aemy --run "PDK_ROOT=/opt/IHP-Open-PDK/ PDK=ihp-sg13g2 librelane --manual-pdk --run-tag hatch_1.0_ihp-sg13g2_0925 --overwrite config.json"