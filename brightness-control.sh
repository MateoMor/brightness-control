#!/bin/bash

# How to run: ~/scripts/brightness-control.sh value0-1

# Get the display identifier
display=$(xrandr | grep " connected" | awk '{print $1}') 

# Get the current brightness
current_brightness=$(xrandr --verbose | grep -i brightness | awk '{print $2}')

# Check if the current brightness was obtained
if [ -z "$current_brightness" ]; then
    echo "Could not obtain current brightness. Exiting."
    exit 1
fi

# Check if a brightness value is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 [brightness_amount_to_add_or_subtract]"
    exit 1
fi

# Get the brightness amount to add or subtract from the first argument
brightness_change=$1

# Calculate the new brightness by adding or subtracting the provided amount
new_brightness=$(echo "$current_brightness + $brightness_change" | bc)

# Check if the new brightness is above 1.0
if (( $(echo "$new_brightness > 1.0" | bc -l) )); then
    new_brightness=1.0
fi

# Check if the new brightness is below 0.3
if (( $(echo "$new_brightness < 0.3" | bc -l) )); then
    new_brightness=0.3
fi

# Set the new brightness value
xrandr --output $display --brightness $new_brightness

echo "Brightness adjusted to $new_brightness"