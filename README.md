# cdwindow

This program uses dbus-monitor output to save the most recently opened directory in Nautilus.  
This is for use with Gnome, which doesn't support `open in terminal` with non default terminals.

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
./cdwindowstart &
```
This will create a backround process in the terminal, after which you may use the command
```bash
. cdwindow
```
or 
```bash
source cdwindow
```
To cd into the most recently opened directory in nautilus. Without the `.` or `source`, it would only change the directory of a child process, which is less than helpful.

### Etc
If you wish to close the terminal but keep `cdwindowstart` running, you can try using `setsid`
```bash
setsid ./cdwindowstart &
```
However, this occasionally doesn't read the user changing directories in Nautilus correctly.  

---

I was expirementing with ways to make the monitoring start on startup or login, but ran into issues with different methods  
- Adding cron job didn't work (but might with a sleep command before it, since it starts long before login)
- Adding script to `/etc/profile.d` caused Gnome GUI to be unable to start (most likely because the script doesnt quit, might be able to workaround with a child process)
- Adding cdwindowstart to `/bin/` resulted in it not functioning properly, even with absolute paths added
- I was unable to get a .desktop file in `~/.config/autostart/` to work properly

