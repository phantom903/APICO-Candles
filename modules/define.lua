
--------------------
--- DEFINE LIGHT ---
--------------------

-- define an object and set it as a light source
-- https://wiki.apico.buzz/wiki/Modding_API#api_define_object()
-- objects are items you can place down, but don't have a menu
-- function define_light()

--   -- define an object as normal
--   -- but with the "has_lighting" property we can make it light up
--   api_define_object({
--     id = 'test_light',
--     name = 'Sample Light',
--     category = 'arm bee aunts',
--     tooltip = 'Put me down',
--     has_lighting = true,
--     has_shadow = true,
--     tools = {'hammer1'}
--   }, '/sprites/light/light_item.png', nil)

-- end

-- ---------------------
-- --- DEFINE FLOWER ---
-- ---------------------

-- -- define a new type of flower
-- -- https://wiki.apico.buzz/wiki/Modding_API#api_define_flower()
-- function define_flower()

--   -- create flower_definition table
--   flower_def = {
--     id = "14",
--     species = "my_flower",
--     title = "My Flower",
--     latin = "Myus Flowerus",
--     hint = "Found in deep water",
--     desc = "This is my cool ocean flower!",
--     aquatic = true,
--     variants = 2,
--     deep = true,
--     smoker = {"stubborn","fiery"},
--     recipes = {
--       { a = "flower14", b = "flower1", s = "flower6" }
--     }
--   }
  
--   -- define flower
--   api_define_flower(flower_def, 
--     "sprites/flower/flower_item.png", "sprites/flower/flower_variants.png", 
--     "sprites/flower/flower_seed_item.png", "sprites/flower/flower_hd.png",
--     {r=100, g=100, b=100}
--   );

-- end


-- ------------------
-- --- DEFINE BEE ---
-- ------------------

-- -- define a new bee and a new bee "trait"
-- -- https://wiki.apico.buzz/wiki/Modding_API#api_define_bee()
-- -- once created you can spawn the bee with /gimme bee.{id} or use api_give_item(bee:{id}, 1)
-- function define_bee()

--   -- setup bee_definition 
--   bee_def = {
--     id = "nightcrawler",
--     title = "Nightcrawler",
--     latin = "Crawly Nighty",
--     hint = "Found on only the darkest of nights",
--     desc = "This is just a cool damn bee",
--     lifespan = {"Normal"},
--     productivity = {"Normal", "Fast"},
--     fertility = {"Fecund", "Prolific"},
--     stability = {"Normal", "Stable"},
--     behaviour = {"Nocturnal"},
--     climate = {"Temperate"},
--     rainlover = false,
--     snowlover = false,
--     grumpy = true,
--     produce = "log",
--     recipes = {
--       { a = "nightcrawler", b = "dream", s = "chaotic" }
--     },
--     calming = {"flower10", "flower11"},
--     chance = 100,
--     bid = "X3",
--     requirement = ""
--   }

--   -- create new bee
--   -- in this example we have a "sprites" folder in our mod root
--   api_define_bee(bee_def, 
--     "sprites/bee/bee_item.png", "sprites/bee/bee_shiny.png", 
--     "sprites/bee/bee_hd.png",
--     {r=100, g=100, b=100},
--     "sprites/bee/bee_mag.png",
--     "My Magazine Headline!",
--     "My magazine body text!"
--   );

--   -- add a new mutation for our new bee
--   -- this will appear on the dream + rocky bee pages (if there's room)
--   -- "mutation_chance" is a script defined in "scripts.lua"
--   api_define_bee_recipe("dream", "rocky", "nightcrawler", "mutation_chance")

--   -- add a new bee trait including our newly defined bee
--   -- this trait will be added to all bees using the defaults set below
--   -- you can then do whatever you like with this trait when you access it through a slot/item stats prop
--   api_define_trait("magic", {
--     common = {"low"}, 
--     dream  = {"low", "medium"}, 
--     nightcrawler = {"high"}
--   }, {"none"}) -- default for all the other bees

-- end

-- ------------------
-- --- DEFINE NPC ---
-- ------------------

-- -- define a new npc
-- -- https://wiki.apico.buzz/wiki/Modding_API#api_define_npc()
-- -- an npc is a special type of menu object that has a dialogue window + a shop menu
-- function define_npc()

--   --set npc definition
--   npc_def = {
--     id = 69,
--     name = "Gobbo",
--     pronouns = "They/Them",
--     tooltip = "Wassup pal?",
--     shop = true,
--     walking = true,
--     stock = {"bee:nightcrawler", "sample_mod_cool_axe", "sample_mod_test_bed", "sample_mod_test_bench", "sample_mod_test_light", "flower14", "wall17", "sample_mod_recycle_bin", "log", "log"}, -- max 10
--     specials = {"log", "log", "log"}, -- must be 3
--     dialogue = {
--       "Wot ya mean av I gots anything other than logs to sell??",
--       "Wot a stoopid question hoomie"
--     },
--     greeting = "Alright pal ow ya gettin' on"
--   }

--   -- define npc
--   api_define_npc(npc_def,
--     "sprites/npc/npc_standing.png",
--     "sprites/npc/npc_standing_h.png",
--     "sprites/npc/npc_walking.png",
--     "sprites/npc/npc_walking_h.png",
--     "sprites/npc/npc_head.png",
--     "sprites/npc/npc_bust.png",
--     "sprites/npc/npc_item.png",
--     "sprites/npc/npc_dialogue_menu.png",
--     "sprites/npc/npc_shop_menu.png"
--   )

-- end