# Minecraft Stat Tracker
This is a data pack for Minecraft 1.14 that tracks various statistics about your game. Currently there are over 4500 statistics tracked. Additionally, Stat Tracker will automatically display a new random statistic in the sidebar twice per day.



TODO add screenshots here



Unfortunately, Stat Tracker can only track what has happened since it was installed. If you want to use it, it is recommended that you install it ASAP, ideally as soon as you create a new world.

## How to:

### Install the data pack

1. Download the [latest release](https://github.com/JimmyCushnie/Minecraft-Stat-Tracker/releases/latest)
1. Put `StatTracker.zip` in the folder `your save file/datapacks`
1. Run this command: `/function stat_tracker:initialization/initialize`

If you are having trouble with step 2, see [this tutorial](https://minecraft.gamepedia.com/Tutorials/Installing_a_data_pack) on the Minecraft Wiki.

Note that if you install Stat Tracker on a new world it might be a while before a statistic shows up in the sidebar. If all players have a score of 0 in a statistic, when that statistic is chosen for display nothing will show up.

### Display a new random statistic in the sidebar

Run this command: `/function stat_tracker:new_sidebar`

### Display a specific statistic in the sidebar

1. Look up the ID of your statistic in [Guide.txt](https://github.com/JimmyCushnie/Minecraft-Stat-Tracker/blob/d2f40d803b3ce3ef9cb28b72ab4ad8cea01bbb6d/Guide.txt)
1. Run this command: `/scoreboard objectives setdisplay sidebar [ID]`

### Stop the sidebar from automatically displaying new random statistics

Run this command: `/function stat_tracker:loop/loop_stop`

Use `/function stat_tracker:loop/loop_start` to start the loop again.

### Change the time interval at which the sidebar automatically displays a new random statistic

For this you will need to edit the data pack. Open the file `data/stat_tracker/functions/loop/loop_start.mcfunction`. There is a value at the end of the file you need to change, more instructions are in the file itself in the comments.

### Change the statistics in the sidebar rotation

For this you will need to edit the data pack. The file you need to edit is `data/stat_tracker/functions/new_sidebar.mcfunction`. There are instructions at the end of that file.