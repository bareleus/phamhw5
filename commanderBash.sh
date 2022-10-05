# commanderBash.sh does not take any argument.
# Example invocation: ./commanderBash.sh

# Turn the LED on
echo "Turning LED on"
./led-hw5.sh on
# Turn the LED off
echo "Turning LED off"
./led-hw5.sh off
# Show the status
echo "Current Status"
./led-hw5.sh status
# Flash the LED
echo "Flashing the LED"
sudo ./led-hw5.sh flash
# Blinking the LED
echo "Blinking the LED 3 times"
./led-hw5.sh blink 3
