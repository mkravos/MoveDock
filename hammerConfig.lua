local debounceDelay = 5.0 -- seconds
local lastRun = 0

-- screenWatcher listens for changes in display configuration
local screenWatcher = hs.screen.watcher.new(function(event)
    local now = hs.timer.secondsSinceEpoch()

    if now - lastRun < debounceDelay then
        -- Ignore the event if it occurred too soon after the last run
        return
    else
        lastRun = now
    end

    hs.execute("/Users/majk/Repos/Scripts/moveDock/moveDock.sh", true)
    hs.alert.show("Changed Dock Position")
end)

screenWatcher:start()

