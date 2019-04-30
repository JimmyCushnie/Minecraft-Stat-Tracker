# this function is triggered by the on_loop function. It sets a random objective to display in the sidebar from a list of objectives.



# the number of objectives you have that you want to be randomly selected among. Listed below.
# note that this is one higher than the highest number in the chain, since the count starts at 0.
scoreboard players set $random_objectives_count x 28









# first, we generate a random number. We do this by creating a new entity (and then immediately kill it) and getting the UUID.
# details on this method: https://minecraftcommands.github.io/commanders-handbook/random-number-generation-with-uuids

summon minecraft:area_effect_cloud ~ ~ ~ {Duration:0,Tags:["rngcloud"]}
execute store result score $random x run data get entity @e[type=minecraft:area_effect_cloud,tag=rngcloud,limit=1] UUIDMost 0.0000000002328306436538696289
kill @e[type=minecraft:area_effect_cloud,tag=rngcloud]


# $random is now somewhere between -2147483648 and 2147483647 (4294967296 or 2^32 possible values).
# We use dvision to reduce this to a range of [-{$random_objectives_count} -1, +{$random_objectives_count}].

scoreboard players set $const_UUID_max x 2147483647

scoreboard players operation $divisor x = $const_UUID_max x
scoreboard players operation $divisor x /= $random_objectives_count x

scoreboard players operation $random x /= $divisor x


# for convenience in the next part of the function, we want to restrict the range to [0, {$random_objectives_count}].
# if the generated random number is below zero, generate a new random number.
execute if score $random x < 0 n run function stat_tracker:new_sidebar


# now that we have a random number, we can use it to determine which objective to put on the sidebar.
# god this is shitty. I hate data packs. This entire data pack would be like 5 lines of code with proper scripting support.

tellraw @p ["",{"text":"Score is"},{"score":{"name":"$random","objective":"x"}}]

###########
# GENERAL #
###########

# deaths
execute if score $random x = 0 n run scoreboard objectives setdisplay sidebar 5

# kills
execute if score $random x = 1 n run scoreboard objectives setdisplay sidebar 5377

# damage dealt
execute if score $random x = 2 n run scoreboard objectives setdisplay sidebar 1791

# damage taken
execute if score $random x = 3 n run scoreboard objectives setdisplay sidebar 1795

# games quit
execute if score $random x = 4 n run scoreboard objectives setdisplay sidebar 1820


############
# MOVEMENT #
############

# jumps
execute if score $random x = 5 n run scoreboard objectives setdisplay sidebar 1819

# distance walked
execute if score $random x = 6 n run scoreboard objectives setdisplay sidebar 1847

# distance crouched
execute if score $random x = 7 n run scoreboard objectives setdisplay sidebar 1788

# distance sprinted
execute if score $random x = 8 n run scoreboard objectives setdisplay sidebar 1837

# distance swum
execute if score $random x = 9 n run scoreboard objectives setdisplay sidebar 1838

# distance by boat
execute if score $random x = 10 n run scoreboard objectives setdisplay sidebar 1783

# distance by horse
execute if score $random x = 11 n run scoreboard objectives setdisplay sidebar 1804

# distance by minecart
execute if score $random x = 12 n run scoreboard objectives setdisplay sidebar 1821


######################
# BLOCK INTERACTIONS #
######################

# Interactions with Crafting Table
execute if score $random x = 13 n run scoreboard objectives setdisplay sidebar 1813

# Interactions with Furnace
execute if score $random x = 14 n run scoreboard objectives setdisplay sidebar 1814

# chests opened
execute if score $random x = 15 n run scoreboard objectives setdisplay sidebar 1824

# BARRELS opened
execute if score $random x = 16 n run scoreboard objectives setdisplay sidebar 1823

# ender chests opened
execute if score $random x = 17 n run scoreboard objectives setdisplay sidebar 1825

# Times Slept in a Bed
execute if score $random x = 18 n run scoreboard objectives setdisplay sidebar 1835


########
# MISC #
########

# animals bred
execute if score $random x = 19 n run scoreboard objectives setdisplay sidebar 1780

# items dropped
execute if score $random x = 20 n run scoreboard objectives setdisplay sidebar 1797

# items enchanted
execute if score $random x = 21 n run scoreboard objectives setdisplay sidebar 1799

# fish caught
execute if score $random x = 22 n run scoreboard objectives setdisplay sidebar 1802

# Music Discs Played
execute if score $random x = 23 n run scoreboard objectives setdisplay sidebar 1830

# plants potted
execute if score $random x = 24 n run scoreboard objectives setdisplay sidebar 1832

# raids triggered
execute if score $random x = 25 n run scoreboard objectives setdisplay sidebar 1833

# raids won
execute if score $random x = 26 n run scoreboard objectives setdisplay sidebar 1834

# traded with villagers
execute if score $random x = 27 n run scoreboard objectives setdisplay sidebar 1842
