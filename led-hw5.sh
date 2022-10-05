#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.

# led-hw5.sh takes the following arguments: on, off, status, flash, blink.
# Example invocation: ./led-hw5.sh on, ./ led-hw5.sh blink 5.

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash, blink or status  \n e.g. bashLED on  "
  echo
  echo -e " As for blink bashLED Command \n  where command is blink and an interger "
  echo -e "   e.g. bashLED blink 5  "
  exit 2
fi
echo "The LED Command that was passed is: $1"

# Turn on the LED
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger
  echo "1" >> "$LED3_PATH/brightness"
# Turn off the LED
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger
  echo "0" >> "$LED3_PATH/brightness"
# Flash the LED
elif [ "$1" == "flash" ]; then
  echo "Flashing the LED"
  removeTrigger
  echo "timer" >> "$LED3_PATH/trigger"
  sleep 1
  echo "100" >> "$LED3_PATH/delay_off"
  echo "100" >> "$LED3_PATH/delay_on"
# Blink the LED
elif [ "$1" == "blink" ]; then
  echo "Blinking the LED" $2 "times"
  removeTrigger
  # Variable to keep track
  count=0
  # Loop to blink
  while [ $2 -gt $count ]
  do
    echo "1" >> "$LED3_PATH/brightness" # Turn on the LED
    sleep 1 # Blink for 1 sec
    echo "0" >> "$LED3_PATH/brightness" # Turn off the LED
    sleep 1 # Wait for 1 sec
    ((count++))
  done
elif [ "$1" == "status" ]; then
  cat "$LED3_PATH/trigger";
fi
echo "End of the LED Bash Script"
