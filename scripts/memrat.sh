#!/bin/bash

# Capture the output of the 'free -m' command
free_output=$(free -m)

# Extract the used and total memory values
used_memory=$(echo "$free_output" | awk '/Mem:/ {print $3}')
total_memory=$(echo "$free_output" | awk '/Mem:/ {print $2}')

# Calculate percentage * 1000 to avoid floating point (bash integer arithmetic)
percentage_x1000=$(( used_memory * 100000 / total_memory ))

# Choose the appropriate block character based on percentage
if (( percentage_x1000 <= 12500 )); then        # <= 12.5%
    block="▁"
elif (( percentage_x1000 <= 25000 )); then      # <= 25%
    block="▂"
elif (( percentage_x1000 <= 37500 )); then      # <= 37.5%
    block="▃"
elif (( percentage_x1000 <= 50000 )); then      # <= 50%
    block="▄"
elif (( percentage_x1000 <= 62500 )); then      # <= 62.5%
    block="▅"
elif (( percentage_x1000 <= 75000 )); then      # <= 75%
    block="▆"
elif (( percentage_x1000 <= 87500 )); then      # <= 87.5%
    block="▇"
else                                             # > 87.5%
    block="█"
fi

# Display the result with the visual indicator
echo "$block $used_memory/${total_memory}MB"

