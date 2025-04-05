#!/bin/bash
# Count occurrences of "Resolution:" from the display profile.
display_count=$(system_profiler SPDisplaysDataType | grep -c "Resolution:")

if [ "$display_count" -gt 1 ]; then
    # At least one external monitor connected: Move the Dock to the left.
    defaults write com.apple.dock orientation left
    echo "External monitor detected. Moving Dock to the left."
else
    # Only the built-in display is active: Move the Dock to the bottom.
    defaults write com.apple.dock orientation bottom
    echo "No external monitor detected. Moving Dock to the bottom."
fi

# Restart the Dock to apply changes.
killall Dock