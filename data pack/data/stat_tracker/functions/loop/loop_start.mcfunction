# Start running the on_loop function every n ticks.


# trigger the on_loop function
function stat_tracker:loop/on_loop

# schedule this command to be run again

# the value at the end of this line determines how often the scoreboard changes.
# valid suffixes: t for ticks, s for seconds, d for days
schedule function stat_tracker:loop/loop_start 0.5d