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

# barrels opened
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


##########
# KILLED #
##########

# Blazes Killed
execute if score $random x = 28 n run scoreboard objectives setdisplay sidebar 2730

# Cave Spiders Killed
execute if score $random x = 29 n run scoreboard objectives setdisplay sidebar 2733

# Chickens Killed
execute if score $random x = 30 n run scoreboard objectives setdisplay sidebar 2735

# Cod Killed
execute if score $random x = 31 n run scoreboard objectives setdisplay sidebar 2736

# Cows Killed
execute if score $random x = 32 n run scoreboard objectives setdisplay sidebar 2738

# Creepers Killed
execute if score $random x = 33 n run scoreboard objectives setdisplay sidebar 2739

# Drowned Killed
execute if score $random x = 34 n run scoreboard objectives setdisplay sidebar 2743

# Endermen Killed
execute if score $random x = 35 n run scoreboard objectives setdisplay sidebar 2749

# Ghasts Killed
execute if score $random x = 36 n run scoreboard objectives setdisplay sidebar 2762

# Husks Killed
execute if score $random x = 37 n run scoreboard objectives setdisplay sidebar 2767

# Magma Cubes Killed
execute if score $random x = 38 n run scoreboard objectives setdisplay sidebar 2776

# Phantoms Killed
execute if score $random x = 39 n run scoreboard objectives setdisplay sidebar 2784

# Pigs Killed
execute if score $random x = 40 n run scoreboard objectives setdisplay sidebar 2785

# Pillagers Killed
execute if score $random x = 41 n run scoreboard objectives setdisplay sidebar 2786

# Ravagers Killed
execute if score $random x = 42 n run scoreboard objectives setdisplay sidebar 2792

# Salmon Killed
execute if score $random x = 43 n run scoreboard objectives setdisplay sidebar 2793

# Sheep Killed
execute if score $random x = 44 n run scoreboard objectives setdisplay sidebar 2794

# Silverfish Killed
execute if score $random x = 45 n run scoreboard objectives setdisplay sidebar 2797

# Skeletons Killed
execute if score $random x = 46 n run scoreboard objectives setdisplay sidebar 2798

# Slimes Killed
execute if score $random x = 47 n run scoreboard objectives setdisplay sidebar 2800

# Spiders Killed
execute if score $random x = 48 n run scoreboard objectives setdisplay sidebar 2806

# Squids Killed
execute if score $random x = 49 n run scoreboard objectives setdisplay sidebar 2807

# Strays Killed
execute if score $random x = 50 n run scoreboard objectives setdisplay sidebar 2808

# Tropical Fish Killed
execute if score $random x = 51 n run scoreboard objectives setdisplay sidebar 2813

# Witches Killed
execute if score $random x = 52 n run scoreboard objectives setdisplay sidebar 2819

# Wither Skeletons Killed
execute if score $random x = 53 n run scoreboard objectives setdisplay sidebar 2821

# Zombies Killed
execute if score $random x = 54 n run scoreboard objectives setdisplay sidebar 2824

# Zombie Villagers Killed
execute if score $random x = 55 n run scoreboard objectives setdisplay sidebar 2827


#############
# KILLED BY #
#############

# Deaths by Blaze
execute if score $random x = 56 n run scoreboard objectives setdisplay sidebar 2832

# Deaths by Creeper
execute if score $random x = 57 n run scoreboard objectives setdisplay sidebar 2841

# Deaths by Drowned
execute if score $random x = 58 n run scoreboard objectives setdisplay sidebar 2845

# Deaths by Skeleton
execute if score $random x = 59 n run scoreboard objectives setdisplay sidebar 2900

# Deaths by Spider
execute if score $random x = 60 n run scoreboard objectives setdisplay sidebar 2908

# Deaths by Zombie
execute if score $random x = 61 n run scoreboard objectives setdisplay sidebar 2926


##########
# BROKEN #
##########

# Iron Axes Broken
execute if score $random x = 62 n run scoreboard objectives setdisplay sidebar 416

# Iron Pickaxes Broken
execute if score $random x = 63 n run scoreboard objectives setdisplay sidebar 429

# Iron Shovels Broken
execute if score $random x = 64 n run scoreboard objectives setdisplay sidebar 430

# Iron Swords Broken
execute if score $random x = 65 n run scoreboard objectives setdisplay sidebar 431

# Diamond Axes Broken
execute if score $random x = 66 n run scoreboard objectives setdisplay sidebar 267

# Diamond Hoes Broken
execute if score $random x = 67 n run scoreboard objectives setdisplay sidebar 272

# Diamond Pickaxes Broken
execute if score $random x = 68 n run scoreboard objectives setdisplay sidebar 276

# Diamond Shovels Broken
execute if score $random x = 69 n run scoreboard objectives setdisplay sidebar 277

# Diamond Swords Broken
execute if score $random x = 70 n run scoreboard objectives setdisplay sidebar 278

# Iron Boots Broken
execute if score $random x = 71 n run scoreboard objectives setdisplay sidebar 419

# Iron Chestplates Broken
execute if score $random x = 72 n run scoreboard objectives setdisplay sidebar 420

# Iron Helmets Broken
execute if score $random x = 73 n run scoreboard objectives setdisplay sidebar 422

# Iron Leggings Broken
execute if score $random x = 74 n run scoreboard objectives setdisplay sidebar 426

# Diamond Boots Broken
execute if score $random x = 75 n run scoreboard objectives setdisplay sidebar 269

# Diamond Chestplates Broken
execute if score $random x = 76 n run scoreboard objectives setdisplay sidebar 270

# Diamond Helmets Broken
execute if score $random x = 77 n run scoreboard objectives setdisplay sidebar 271

# Diamond Leggings Broken
execute if score $random x = 78 n run scoreboard objectives setdisplay sidebar 274

# Bows Broken
execute if score $random x = 79 n run scoreboard objectives setdisplay sidebar 115

# Flint and Steels Broken
execute if score $random x = 80 n run scoreboard objectives setdisplay sidebar 332

# Shears Broken
execute if score $random x = 81 n run scoreboard objectives setdisplay sidebar 741

# Shields Broken
execute if score $random x = 82 n run scoreboard objectives setdisplay sidebar 743


###########
# CRAFTED #
###########

# Torches Crafted
execute if score $random x = 83 n run scoreboard objectives setdisplay sidebar 1714

# Jack o'Lanterns Crafted
execute if score $random x = 84 n run scoreboard objectives setdisplay sidebar 1311

# Ladders Crafted
execute if score $random x = 85 n run scoreboard objectives setdisplay sidebar 1331

# Lanterns Crafted
execute if score $random x = 86 n run scoreboard objectives setdisplay sidebar 1332

# Epty Maps Crafted
execute if score $random x = 87 n run scoreboard objectives setdisplay sidebar 1405

# Shields Crafted
execute if score $random x = 88 n run scoreboard objectives setdisplay sidebar 1620

# Oak Boats Crafted
execute if score $random x = 89 n run scoreboard objectives setdisplay sidebar 1452

# Scaffolding Crafted
execute if score $random x = 90 n run scoreboard objectives setdisplay sidebar 1613

# Lapis Lazuli Blocks Crafted
execute if score $random x = 91 n run scoreboard objectives setdisplay sidebar 1333

# Blocks of Redstone Crafted
execute if score $random x = 92 n run scoreboard objectives setdisplay sidebar 1596

# Blocks of Gold Crafted
execute if score $random x = 93 n run scoreboard objectives setdisplay sidebar 1224

# Blocks of Iron Crafted
execute if score $random x = 94 n run scoreboard objectives setdisplay sidebar 1295

# Blocks of Quartz Crafted
execute if score $random x = 95 n run scoreboard objectives setdisplay sidebar 1560

# Blocks of Coal Crafted
execute if score $random x = 96 n run scoreboard objectives setdisplay sidebar 1054

# Blocks of Diamond Crafted
execute if score $random x = 97 n run scoreboard objectives setdisplay sidebar 1145

# Blocks of Emerald Crafted
execute if score $random x = 98 n run scoreboard objectives setdisplay sidebar 1175

# Stone Crafted
execute if score $random x = 99 n run scoreboard objectives setdisplay sidebar 1673

# Smooth Stone Crafted
execute if score $random x = 100 n run scoreboard objectives setdisplay sidebar 1643

# Bricks Crafted
execute if score $random x = 101 n run scoreboard objectives setdisplay sidebar 1003

# Stone Bricks Crafted
execute if score $random x = 102 n run scoreboard objectives setdisplay sidebar 1678

# Mossy Cobblestone Crafted
execute if score $random x = 103 n run scoreboard objectives setdisplay sidebar 1413

# Slime Blocks Crafted
execute if score $random x = 104 n run scoreboard objectives setdisplay sidebar 1630

# Bone Meal Crafted
execute if score $random x = 105 n run scoreboard objectives setdisplay sidebar 989

# Books Crafted
execute if score $random x = 106 n run scoreboard objectives setdisplay sidebar 990

# Bookshelves Crafted
execute if score $random x = 107 n run scoreboard objectives setdisplay sidebar 991

# Book and Quills Crafted
execute if score $random x = 108 n run scoreboard objectives setdisplay sidebar 1761

# Mushroom Stew Crafted
execute if score $random x = 109 n run scoreboard objectives setdisplay sidebar 1423

# Spruce Planks Crafted
execute if score $random x = 110 n run scoreboard objectives setdisplay sidebar 1662

# Acacia Planks Crafted
execute if score $random x = 111 n run scoreboard objectives setdisplay sidebar 910

# Dark Oak Planks Crafted
execute if score $random x = 112 n run scoreboard objectives setdisplay sidebar 1113

# Jungle Planks Crafted
execute if score $random x = 113 n run scoreboard objectives setdisplay sidebar 1321

# Oak Planks Crafted
execute if score $random x = 114 n run scoreboard objectives setdisplay sidebar 1459

# Birch Planks Crafted
execute if score $random x = 115 n run scoreboard objectives setdisplay sidebar 949

# Pistons Crafted
execute if score $random x = 116 n run scoreboard objectives setdisplay sidebar 1508

# Sticks Crafted
execute if score $random x = 117 n run scoreboard objectives setdisplay sidebar 1671

# Sticky Pistons Crafted
execute if score $random x = 118 n run scoreboard objectives setdisplay sidebar 1672

# Paintings Crafted
execute if score $random x = 119 n run scoreboard objectives setdisplay sidebar 1485

# Item Frames Crafted
execute if score $random x = 120 n run scoreboard objectives setdisplay sidebar 1310

# Anvils Crafted
execute if score $random x = 121 n run scoreboard objectives setdisplay sidebar 925

# Bows Crafted
execute if score $random x = 122 n run scoreboard objectives setdisplay sidebar 992

# Leads Crafted
execute if score $random x = 123 n run scoreboard objectives setdisplay sidebar 1338

# Fishing Rods Crafted
execute if score $random x = 124 n run scoreboard objectives setdisplay sidebar 1206

# Shears Crafted
execute if score $random x = 125 n run scoreboard objectives setdisplay sidebar 1618

# Flint and Steels Crafted
execute if score $random x = 126 n run scoreboard objectives setdisplay sidebar 1209

# Diamond Axes Crafted
execute if score $random x = 127 n run scoreboard objectives setdisplay sidebar 1144

# Diamond Boots Crafted
execute if score $random x = 128 n run scoreboard objectives setdisplay sidebar 1146

# Diamond Chestplates Crafted
execute if score $random x = 129 n run scoreboard objectives setdisplay sidebar 1147

# Diamond Helmets Crafted
execute if score $random x = 130 n run scoreboard objectives setdisplay sidebar 1148

# Diamond Hoes Crafted
execute if score $random x = 131 n run scoreboard objectives setdisplay sidebar 1149

# Diamond Pickaxes Crafted
execute if score $random x = 132 n run scoreboard objectives setdisplay sidebar 1153

# Diamond Shovels Crafted
execute if score $random x = 133 n run scoreboard objectives setdisplay sidebar 1154

# Diamond Swords Crafted
execute if score $random x = 134 n run scoreboard objectives setdisplay sidebar 1155
