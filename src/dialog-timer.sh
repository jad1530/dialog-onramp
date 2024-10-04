#!/bin/zsh

#courtesy of drizzy on MacAdmins Slack

# Variables
dialogPath="/usr/local/bin/dialog"

# Functions
check_dialog_exit_code(){
    # This function checks if the user clicked Cancel or somehow quit dialog, and exits the script if they did.

    # If dialog exit code is 0, that means they clicked button 1.
    # If dialog is NOT zero, then
    if [ "$dialogResults" != 0 ]; then
        # Report something happened and exit.
        echo "User cancelled or dialog quit with exit code: $dialogResults"
        exit $dialogResults
    fi
}

##### Script starts here

# Open our first dialog window
"$dialogPath" --title "TITLE " --message "MESSAGE" --centreicon --icon "none" --messagefont size=17 --timer "10" --height "30%" --width "50%" --ontop --blurscreen --button1text "NEXT SCREEN" --button2text "Later"
# Capture the exit code of Dialog. This MUST come immediately after the command that calls dialog window
dialogResults=$?
# Check what the user clicked
check_dialog_exit_code

# Open our second dialog window
"$dialogPath" --title "TITLE" --timer "10" --message "MESSAGE" --webcontent "https://google.com" --icon "none" --height "80%" --width "80%" --button1text "NEXT SCREEN"
# Capture the exit code of Dialog. This MUST come immediately after the command that calls dialog window
dialogResults=$?
# Check what the user clicked
check_dialog_exit_code

# Open our third dialog window
"$dialogPath" --title "TITLE" --timer "10" --message "MESSAGE" --webcontent "https://www.google.com" --icon "none" --height "80%" --width "80%" --button1text "NEXT SCREEN"
# Capture the exit code of Dialog. This MUST come immediately after the command that calls dialog window
dialogResults=$?
# Check what the user clicked
check_dialog_exit_code

# Open our fourth dialog window
"$dialogPath" --title "TITLE" --timer "250" --message "MESSAGE" --webcontent "https://www.google.com" --icon "none" --height "80%" --width "80%" --button1text "NEXT SCREEN"
# Capture the exit code of Dialog. This MUST come immediately after the command that calls dialog window
dialogResults=$?
# Check what the user clicked
check_dialog_exit_code

# Open our fifth dialog window
"$dialogPath" --title "TITLE" --timer "250" --message "MESSAGE" --webcontent "https://www.google.com" --icon "none" --height "80%" --width "80%" --button1text "NEXT SCREEN"
# Capture the exit code of Dialog. This MUST come immediately after the command that calls dialog window
dialogResults=$?
# Check what the user clicked
check_dialog_exit_code

#code section from @BigMacAdmin

#Very important that this part comes immediately after the dialog command
dialogResults=$?

echo "Dialog exited with the following code: $dialogResults"

if [ "$dialogResults" = 0 ]; then
    echo "Do the things you want when button1 is clicked"
elif [ "$dialogResults" = 2 ]; then
    echo "Do the things you want when button2 is clicked"
elif [ "$dialogResults" = 3 ]; then
    echo "Do the things you want when button3 (info button) is clicked"
elif [ "$dialogResults" = 4 ]; then
    echo "Do the things you want when a timer runs out"
elif [ "$dialogResults" = 10 ]; then
    echo "Do the things you want when the user used the quitkey combination"
else
    echo "Dialog exited with an unexpected code."
    echo "Could be an error in the dialog command"
    echo "Could be the process killed somehow."
    echo "Exit with an error code."
    exit "$dialogResults"
fi