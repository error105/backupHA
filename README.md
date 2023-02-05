# backupHA
GIT backup for HomeAssistant...
Simple script that allow us to make backup our HomeAssistant, ESPhome, or anything we want to GIT.
After use, the script push our folder to GIT and create file called: backup_$FOLDER.sh
This file we will use in automation in HomeAssistan to make backup day by day, or hour by hour (like we wont).
Just we need add in configuration.yaml in Home assistant:

shell_command:
  git_backup: bash /location/backup_$FOLDER.sh
