#!/bin/bash

# Basic imports

user=$(whoami)
date=$(date)

# Settings imports

echo "Importing provided settings..."
settings_line1=$(sed -n 1p settings.yaml)
settings_line2=$(sed -n 2p settings.yaml)
settings_line3=$(sed -n 3p settings.yaml)
settings_line4=$(sed -n 4p settings.yaml)
settings_line5=$(sed -n 5p settings.yaml)
settings_line6=$(sed -n 6p settings.yaml)
settings_line7=$(sed -n 7p settings.yaml)
settings_line8=$(sed -n 8p settings.yaml)
settings_line9=$(sed -n 9p settings.yaml)
settings_line10=$(sed -n 10p settings.yaml)
settings_line11=$(sed -n 11p settings.yaml)
settings_line12=$(sed -n 12p settings.yaml)
settings_line13=$(sed -n 13p settings.yaml)
settings_line14=$(sed -n 14p settings.yaml)

# Cleaning up

echo "Are you sure you want to cleanup your system? (y/n)"
read answer

if [ "$answer" == "n" ]; then
      exit 1
fi

echo "Note that you can customize directories and files to be removed in the settings"
echo "Starting cleaning up system..."

# Removing directories in settings.txt

# Bash history
if [ "$settings_line1" == "Bash_history: True" ]; then
      history -c  >&- 2>&-
      echo "Deleted bash history..."
      sleep 1
fi
# Temporary files

if [ "$settings_line2" == "Temporary_files: True" ]; then
      echo "Deleting temporary files..."
      rm -r /home/"$user"/tmp/  >&- 2>&-
      sleep 1
fi

# Discord cache
if [ "$settings_line3" == "Discord_cache: True" ]; then
      echo "Deleting discord cache..."
      rm -r /home/"$user"/.config/discord/  >&- 2>&-
      sleep 1
fi

# Dnf autoremove
if [ "$settings_line4" == "Dnf_autoremove: True" ]; then
      echo "Running dnf autoremove..."
      sudo dnf autoremove -y  >&- 2>&-
      sleep 1
fi

# Dnf clean
if [ "$settings_line5" == "Dnf_clean: True" ]; then
      echo "Running dnf clean..."
      sudo dnf clean all -y  >&- 2>&-
      sleep 1
fi

# Firefox cache
if [ "$settings_line6" == "Firefox_cache: True" ]; then
      echo "Deleting firefox cache..."
      rm -r /home/"$user"/.cache/mozilla/firefox/  >&- 2>&-
      sleep 1
fi

# Firefox cookies
if [ "$settings_line7" == "Firefox_cookies: True" ]; then
      echo "Deleting firefox cookies..."
      rm -r /home/"$user"/.mozilla/firefox/  >&- 2>&-
      sleep 1
fi

# Chrome cache
if [ "$settings_line8" == "Chrome_cache: True" ]; then
      echo "Deleting chrome cache..."
      rm -r "$user"/.cache/google-chrome/  >&- 2>&-
      sleep 1
fi

# Chrome crash reports
if [ "$settings_line9" == "Chrome_cookies: True" ]; then
      echo "Deleting chrome crash reports..."
      rm -r /home/"$user"/.config/google-chrome/Crash \Reports/  >&- 2>&-
      sleep 1
fi

# Trash
if [ "$settings_line10" == "Trash: True" ]; then
      echo "Cleaning trash..."
      rm -rf /home/"$user"/.local/share/Trash/*  >&- 2>&-
      sleep 1
fi

# System cache
if [ "$settings_line11" == "System_cache: True" ]; then
      echo "Deleting system cache..."
      rm -rf /home/"$user"/.cache/  >&- 2>&-
      sleep 1
fi

# System logs
if [ "$settings_line12" == "System_logs: True" ]; then
      echo "Deleting system logs..."
      sudo rm -r /var/log/*
      sleep 1
fi

# Firefox history
if [ "$settings_line13" == "Firefox_history: True" ]; then
      echo "Deleting firefox history..."
      rm -r /home/"$user"/.mozilla/firefox/  >&- 2>&-
      sleep 1
fi

# Chrome history
if [ "$settings_line14" == "Chrome_history: True" ]; then
      echo "Deleting chrome history..."
      rm -r /home/"$user"/.config/google-chrome/Default/History/  >&- 2>&-
      rm -r /home/"$user"/.config/chromium/Default/History/ >&- 2>&-
      sleep 1
fi


# Removing directories in custom_directories.txt
