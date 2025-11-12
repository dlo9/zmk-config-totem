#!/bin/sh

# 1. Initialize west with your config directory
west init -l config

# 2. Update west to fetch ZMK and dependencies
west update --fetch-opt=--filter=tree:0

# 3. Export Zephyr environment
west zephyr-export

# 4. Build the firmware
# You'll need to specify your board and shield from your build.yaml file
# For the Totem keyboard (split), you'd run this for each side:

# Left side:
west build -s zmk/app -b seeeduino_xiao_ble -- -DZMK_CONFIG="$(pwd)/config" -DSHIELD="totem_left"

# Right side (after cleaning):
rm -rf build
west build -s zmk/app -b seeeduino_xiao_ble -- -DZMK_CONFIG="$(pwd)/config" -DSHIELD="totem_right"
