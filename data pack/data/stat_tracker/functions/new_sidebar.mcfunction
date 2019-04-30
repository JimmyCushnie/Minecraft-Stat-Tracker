# this function is triggered by the on_loop function. It sets a random objective to display in the sidebar from a list of objectives.


scoreboard objectives add x dummy

# first, generate a random number. We do this by creating a new entity (which immediately despawns) and getting the UUID.
# details on this method: https://minecraftcommands.github.io/commanders-handbook/random-number-generation-with-uuids

summon minecraft:area_effect_cloud ~ ~ ~ {Duration:0,Tags:["rngcloud"]}
execute store result score $random x run data get entity @e[type=minecraft:area_effect_cloud,tag=rngcloud,limit=1] UUIDMost 0.0000000002328306436538696289

# $random is now somewhere between -2147483648 and 2147483647 (4294967296 / 2^32 possible values).
# We use dvision to reduce this to a range of [-10, +9].

scoreboard players set $const_divisor x 214748364
scoreboard players operation $random x /= $const_divisor x