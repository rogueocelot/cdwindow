#!/bin/bash

mkdir ~/.cdwindow
cp getloc.rb getrecent.rb cdwindowstart ~/.cdwindow/
touch ~/.cdwindow/dest.txt
touch ~/.cdwindow/location.txt
sudo chmod +x ~/.cdwindow/cdwindowstart
sudo chmod +x cdwindow
sudo cp cdwindow /bin
