# Savant-RaspberryPi-Sensor
Savant Profile to detect Raspberry Pi GPIO INPUT pin state changes. This can be used to detect when a button is pressed or when a motion detector senses motion.
## Synopsis
The included Savant profile can be used to detect when Raspberry Pi pin states change without polling. The profile requires Pi4J to be installed on the Raspberry Pi, which uses wiringPi and Java to listen for pin state changes and print them to console. It only prints to the console that initiates the program so the java program starts from within an included bash script that runs on the Pi. After the profile connects, it runs the script from the home directory and begins listening on the console port. The username and password of the Raspberry Pi can be set with user variables on the device in Blueprint. The profile uses telnet to communicate so a telnet server will also need to be installed. 
## Installation
STEP 1: Install Pi4J on your Raspberry Pi. Reference http://pi4j.com/ for full instructions and usage.
```
curl -s get.pi4j.com | sudo bash
```
If you get a message like "Unable to determine hardware version. I see: Hardware: BCM2835" you will most likely need to install the SNAPSHOT version referenced here.
http://pi4j.com/download.html

STEP 2: Navigate to Examples folder
```
cd /opt/pi4j/examples
```
STEP 3: Compile ListenMultipleGpioExample.java
```
javac -classpath .:classes:/opt/pi4j/lib/'*' -d . ListenMultipleGpioExample.java
```
STEP 4: Verify Program runs
```
sudo java -classpath .:classes:/opt/pi4j/lib/'*' ListenMultipleGpioExample
```
STEP 5: Test Program
Connect Buttons or contact sensors to GPIO 0-7 and activate to view changes print to console, you should see something like below.
```
--> GPIO PIN STATE CHANGE: "GPIO 2" <GPIO 2> = HIGH
--> GPIO PIN STATE CHANGE: "GPIO 2" <GPIO 2> = LOW
```
CTRL-C to close the program and exit back to the command prompt.
STEP 6: Upload sensors.sh to Raspberry Pi home directory (Use Filezilla or your another FTP/SFTP client to transfer the file.)
You can also just make a file called sensors.sh in the home directory of the pi and add the following (make sure the file is executable):
```
#!/bin/sh

cd /opt/pi4j/examples
sudo java -classpath .:classes:/opt/pi4j/lib/'*' ListenMultipleGpioExample
```
Test script to make sure it runs from command prompt
```
bash sensors.sh
```
CTRL-C to close the program and exit back to the command prompt.
STEP 7 : Install telnet server
```
sudo apt-get install telnetd
```
STEP 8: Add profile to Blueprint Library then add to configuration.

