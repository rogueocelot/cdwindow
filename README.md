# cdwindow

This program uses dbus-monitor output to save the most recently opened directory in Nautilus (GNOME Files).  
This is for use with GNOME, which only supports right click -> `open in terminal` with GNOME Terminal.

## Installation
To install, `cd` into the program directory and run:
```bash
./install.sh
```
this will:  
- create the `~/.cdwindow/` directory and add the appropriate files  
- add the cdwindow script to `/bin/`  
- make scripts executable  

**Note**: do not run the install script as sudo, or else it will create `.cdwindow` in `su`'s home directory

## Removal
To remove:  
- delete `~/.cdwindow/`
- remove `cdwindow` from `/bin/`  

## Usage
To start monitoring dbus-monitor, use the following commands:
```bash
cd ~/.cdwindow/
ruby getloc.rb &
```
or
```bash
cd ~/.cdwindow/
./getloc.rb &
```

This will create a backround process in the terminal, after which you may use the command
```bash
. cdwindow
```
or 
```bash
source cdwindow
```
To cd into the most recently opened directory in Nautilus. Without the `.` or `source`, it would only change the directory of a child process, which is less than helpful.

### Example Usage
![Example usage](example.png?raw=true)  
with /backup/emacs being the directory open in Nautilus.

### Etc
If you wish to close the terminal but keep `getloc.rb` running, you can try using `setsid`
```bash
setsid ./getloc.rb &
```
However, this occasionally doesn't read the user changing directories in Nautilus correctly.  

---

I was expirementing with ways to make the monitoring start on startup or login, but ran into issues with different methods  
- Adding cron job didn't work (but might with a sleep command before it, since it starts long before login)
- Adding script to `/etc/profile.d` caused GNOME GUI to be unable to start (most likely because the script doesnt quit, might be able to workaround with a child process)
- Adding getloc.rb to `/bin/` resulted in it not functioning properly
- I was unable to get a .desktop file in `~/.config/autostart/` to work properly

