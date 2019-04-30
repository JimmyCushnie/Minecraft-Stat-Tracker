# Start running the on_loop function every n ticks.


# trigger the on_loop function
function stat_tracker:loop/on_loop

# schedule this command to be run again in n ticks
schedule function stat_tracker:loop/loop_start 20t