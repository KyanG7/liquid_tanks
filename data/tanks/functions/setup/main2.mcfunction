execute as @s at @s run function #tanks:tanks_tick

execute at @s[scores={ES_ID=0}] run data merge block ~ ~ ~ {CustomName: "{\"italic\":false,\"color\":\"aqua\",\"text\":\"Liquid Tank\"}", Items: [{Slot: 0b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b, tag: {display: {Name: "{\"text\":\"\"}"}, gui: 1b}}, {Slot: 1b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b, tag: {display: {Name: "{\"text\":\"\"}"}, gui: 1b}}, {Slot: 2b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b, tag: {display: {Name: "{\"text\":\"\"}"}, gui: 1b}}, {Slot: 3b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b, tag: {display: {Name: "{\"text\":\"\"}"}, gui: 1b}}, {Slot: 4b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b, tag: {display: {Name: "{\"text\":\"\"}"}, gui: 1b}}], id: "minecraft:hopper", Lock: ""}

data merge entity @s {Fire:100s}

execute unless score @s ES_ID matches 1.. run scoreboard players set @s ES_ID 0
execute at @s run data merge block ~ ~ ~ {TransferCooldown:999999}
execute at @s if entity @s[tag=hasXP] if block ~ ~ ~ air run summon experience_orb ~ ~1 ~ {Tags:["return"],Health:10b}
execute at @s if entity @s[tag=hasXP] if block ~ ~ ~ air store result entity @e[type=experience_orb,sort=nearest,limit=1] Value short 1 run scoreboard players get @s ES_stored
execute at @s if block ~ ~ ~ air run kill @s

#Tagging
execute as @s[scores={ES_stored=..0}] run function #tanks:tanks_when_empty
execute as @s[scores={ES_stored=..0}] run scoreboard players set @s ES_ID 0
execute if score @s ES_stored matches ..0 run scoreboard players reset @s ES_temp

#functions
execute as @s at @s run function #tanks:tanks_fill

#Naming
execute at @s if entity @s[scores={ES_ID=0}] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Empty\",\"color\":\"white\"}"}
execute as @s at @s if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run function #tanks:tanks_names
#execute at @s if entity @s[scores={ES_ID=1}] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Water\",\"color\":\"blue\"}"}
#execute at @s if entity @s[tag=hasLava] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Lava\",\"color\":\"gold\"}"}
#execute at @s if entity @s[tag=hasMilk] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Milk\",\"color\":\"gray\"}"}
#execute at @s if entity @s[tag=hasDraBre] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Dragon's Breath\",\"color\":\"light_purple\"}"}
#execute at @s if entity @s[tag=hasXP] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Experience\",\"color\":\"green\"}"}
#execute at @s if entity @s[tag=hasLev] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Levitation\",\"color\":\"aqua\"}"}

#Head Change
execute as @s[scores={ES_ID=0}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:glass",Count:1b}]}
execute as @s at @s run function #tanks:tanks_heads
execute as @s[tag=hasLava] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"3a6df1ec-1eaa-4006-9954-b3ae78e3f510",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYmVjYTg3ODA5Y2E2MWI4YWE4ZGY4ZGM3YTM3MGFjMDEwMTFiMzA3YWE2YzY5NDkyNjU3ZGJmMGUwZGZlNzFiMyJ9fX0="}]}}}}]}
execute as @s[tag=hasMilk] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"f89da645-d752-4b67-a377-a7deb698e615",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjM5ZTkzZTZmOTQwYjY1ZTI2MjM1ZGFhZDQ0NTVhYmQ1OTg5NThiZDQ1NmUwMWVjZDQxMmFkNzdlZWNiZjIxYyJ9fX0="}]}}}}]}
execute as @s[tag=hasDraBre] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"383a7e5b-2b14-4734-afe5-ce64011748e9",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzY2MmJhMGE2YzY1ZmRjMTViYWI0MDk4YmIxYjg3MjVlNDM0MTcyNmQwZTkwY2NiNTNmN2RhOTI2MGYwYTk3MiJ9fX0="}]}}}}]}
execute as @s[tag=hasXP] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"4a34f0ad-7cc3-4260-b4a9-1201cf4c2a83",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTEwNzU0NjMzNGMyZjg3OWQzNGEwYTE5ZjIzMWQ3ZjU5YjU0MmM3MjJmYTViY2I2NGNkNDkwNDM2NDA1ZGZmOCJ9fX0="}]}}}}]}
execute as @s[tag=hasLev] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"b2fa08e4-918e-4c3e-925e-5830fa96ca53",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2I2ZGI5ODBhNTI0OTYwOTdkZmE4ZDU3ZGZiOTlkOGIxMjAxMTljNzExMzgzNThhNGRhMjliZWYwNmExZDZjMSJ9fX0="}]}}}}]}

#Particles
execute at @s if entity @s[tag=hasWater] if score XPTimer ES_temp matches 19..20 run particle dripping_water ~ ~1.1 ~ 0.1 0 0.1 0.1 3 normal @a[distance=..5]
execute at @s if entity @s[tag=hasLava] if score XPTimer ES_temp matches 19..20 run particle lava ~ ~1.1 ~ 0.1 0 0.1 0.1 1 normal @a[distance=..5]
execute at @s if entity @s[tag=hasMilk] if score XPTimer ES_temp matches 19..20 run particle block white_concrete ~ ~1.1 ~ 0 0 0 0.1 3 normal @a[distance=..5]
execute at @s if entity @s[tag=hasXP] if score XPTimer ES_temp matches 19..20 run particle block lime_glazed_terracotta ~ ~1.1 ~ 0 0 0 0.1 3 normal @a[distance=..5]
execute at @s if entity @s[tag=hasLev] if score XPTimer ES_temp matches 19..20 run particle end_rod ~ ~1.1 ~ 0 0 0 0.1 3 normal @a[distance=..5]
execute at @s if entity @s[tag=hasDraBre] if score XPTimer ES_temp matches 19..20 run particle witch ~ ~.9 ~ 0 0 0 0.1 3 normal @a[distance=..5]
execute at @s if entity @s[tag=hasDraBre] if score XPTimer ES_temp matches 10..11 if score @s ES_temp matches 51..200 run particle witch ~ ~1 ~ 0 0 0 0.1 10 normal @a[distance=..5]
execute at @s if entity @s[tag=hasDraBre] if score XPTimer ES_temp matches 11..20 if score @s ES_temp matches 51..200 run particle witch ~ ~1 ~ 0 0 0 0.1 10 normal @a[distance=..5]
