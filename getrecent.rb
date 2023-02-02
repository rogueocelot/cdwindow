#!/usr/local/bin/ruby -w

#if the variable is defined in the do loop, you cant use it outside
mostRecent = nil

while true do
  #go through each line of dbus-monitor output
  IO.foreach("location.txt") do |i|
    #check for regex match
    if i =~ /string .file:../
      #puts i
      #clean the string
      mostRecent = i[30..-3]
      #mostRecent = mostRecent[0..-2]
    end
  end
  #clean location file
  File.open("location.txt", "w") {|file| file.truncate(0)}
  #clean old address
  File.open("dest.txt", "w") {|file| file.truncate(0)}
  #write most recent address
  File.open("dest.txt", "w") {|file| file.write(mostRecent)}
  #print it for debugging
  #puts mostRecent

  sleep(3)
end

