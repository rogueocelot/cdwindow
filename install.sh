#!/bin/bash

mkdir ~/.cdwindow
cp getloc.rb ~/.cdwindow/
touch ~/.cdwindow/dest.txt
touch ~/.cdwindow/location.txt
sudo chmod +x ~/.cdwindow/getloc.rb
sudo chmod +x cdwindow
sudo cp cdwindow /bin
