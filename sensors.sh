#!/bin/sh

cd /opt/pi4j/examples
sudo java -classpath .:classes:/opt/pi4j/lib/'*' ListenMultipleGpioExample
