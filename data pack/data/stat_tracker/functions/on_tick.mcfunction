# This function runs each time there is a game tick. There are 20 game ticks per second and 24000 game ticks per in-game day.


# increment counter
scoreboard players add @a counter 1

# if any player's counter score is equal to or greater than n, run the new_sidebar function.
# I have n set to 12000, which equates to one new scoreboard every 10 minutes or two new scoreboards per in-game day.

execute as @a[scores={counter=100..}] run function stat_tracker:new_sidebar