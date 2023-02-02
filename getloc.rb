#!/usr/local/bin/ruby -w


IO.popen("dbus-monitor \"path='/org/freedesktop/FileManager1'\" > location.txt") do |output|

end
