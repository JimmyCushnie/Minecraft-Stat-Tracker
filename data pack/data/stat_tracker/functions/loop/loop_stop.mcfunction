# stop running the loop

# the loop works by scheduling the loop_start function.
# Here we cancel the next scheduled loop_start by scheduling that function for 100000000000000000 days from now.

schedule function stat_tracker:loop/loop_start 100000000000000000d

# note: as of 1.14, the schedule time actually caps at 2147483647 (2^31 -1) ticks, which is equivelant to about 3.4 years at default tick speed.
# so technically, this command just pauses the loop for 3.4 years, it doesn't actually stop it.