tell application "System Events"
  repeat 3 times
    try
      tell application "Google Chrome" to activate
      delay 1
      tell application "System Events"
        tell process "Google Chrome"
          keystroke "f" using {command down, control down}
        end tell
      end tell
      return
    end try
    delay 2
  end repeat
end tell
