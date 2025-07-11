#!/bin/bash -e

nix-shell --pure /opt/librelane --run "librelane --run-tag hatch_1.0_ihp-sg13g2_0925 --overwrite config.json"