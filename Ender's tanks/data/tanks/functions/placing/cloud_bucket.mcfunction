execute as @s[scores={ES_useCOAS=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] at @s positioned ~ ~1.61 ~ unless score @s ES_temp matches 1.. store success score @s ES_temp unless block ^ ^ ^1 air align xyz positioned ^ ^ ^ run summon area_effect_cloud ~.5 ~0.2 ~.5 {Particle:"entity_effect",Radius:1f,Duration:200,Color:13431807,Effects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}]}
execute as @s[scores={ES_useCOAS=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] at @s positioned ~ ~1.61 ~ unless score @s ES_temp matches 1.. store success score @s ES_temp unless block ^ ^ ^2 air align xyz positioned ^ ^ ^1 run summon area_effect_cloud ~.5 ~0.2 ~.5 {Particle:"entity_effect",Radius:1f,Duration:200,Color:13431807,Effects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}]}
execute as @s[scores={ES_useCOAS=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] at @s positioned ~ ~1.61 ~ unless score @s ES_temp matches 1.. store success score @s ES_temp unless block ^ ^ ^3 air align xyz positioned ^ ^ ^2 run summon area_effect_cloud ~.5 ~0.2 ~.5 {Particle:"entity_effect",Radius:1f,Duration:200,Color:13431807,Effects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}]}
execute as @s[scores={ES_useCOAS=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] at @s positioned ~ ~1.61 ~ unless score @s ES_temp matches 1.. store success score @s ES_temp unless block ^ ^ ^4 air align xyz positioned ^ ^ ^3 run summon area_effect_cloud ~.5 ~0.2 ~.5 {Particle:"entity_effect",Radius:1f,Duration:200,Color:13431807,Effects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}]}
execute as @s[scores={ES_useCOAS=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] at @s positioned ~ ~1.61 ~ unless score @s ES_temp matches 1.. store success score @s ES_temp unless block ^ ^ ^5 air align xyz positioned ^ ^ ^4 run summon area_effect_cloud ~.5 ~0.2 ~.5 {Particle:"entity_effect",Radius:1f,Duration:200,Color:13431807,Effects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}]}

execute as @s[scores={ES_useCOAS=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] if score @s ES_temp matches 1.. run tag @s add placeCB
execute as @s[tag=placeCB] run scoreboard players reset @s ES_temp
execute if entity @s[tag=placeCB,gamemode=!creative] run replaceitem entity @s weapon.mainhand bucket 1
execute as @s[tag=placeCB] run tag @s remove placeCB
scoreboard players reset @s ES_useCOAS