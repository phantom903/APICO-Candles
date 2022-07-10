-- Candles Mod v0.0

MOD_NAME = "candles"
MOD_VERSION = "0.0"


function register()
  return {
    name = MOD_NAME,
    hooks = {"ready", "click"}, -- subscribe to hooks we want so they're called
    modules = {"define", "scripts", "candle", "machines"} -- load other modules we need, in this case "/modules/define.lua" and "/modules/scripts.lua"
  }
end

function init() 

  -- turn on devmode
  api_set_devmode(true)

  api_log("init", "Candles loaded!")

  define_candles()
  define_machines()
  -- define our mod workbench labels (for our item's recipe)
  -- api_define_workbench("Candle Maker", {
  --   t1 = "Sample Tab 1",
  --   t2 = "Sample Tab 2",
  --   t3 = "Sample Tab 3",
  --   t4 = "Sample Tab 4",
  --   t5 = "Sample Tab 5",
  -- })
  -- define a new object that can be sat on like a bench
  -- define_bench()
  -- define a new object that can be slept in like a bed
  -- define_bed()
  -- define a new object that will light up like a lantern
  -- define_light()
  -- define a new type of wall
  -- define_wall()
  -- define a new type of flower
  -- define_flower()
  -- define a new type of bee
  -- define_bee()
  -- define a new NPC
  -- define_npc()
  -- define a new menu object, in this case a "recycler" that turns items into seeds 
  -- WARNING: advanced
  -- define_recycler()

  -- define a custom command so we can spawn in all our new goodies
  -- "command_treats" is defined in "scripts.lua"
  -- api_define_command('/treats', "command_treats")

  -- if you dont return success here your mod will not load
  -- this can be useful if your define fails as you can decide to NOT return "Success" to tell APICO 
  -- that something went wrong and to ignore your mod
  return "Success"
end

function ready()

  -- if we haven't already spawned our new npc, spawn them
  --friend = api_get_menu_objects(nil, "npc69")
  --if #friend == 0 then
  --  player = api_get_player_position()
  --  api_create_obj("npc69", player["x"] + 16, player["y"] - 32)
  --end

  -- play a sound to celebrate our mod loading! :D
  --api_play_sound("confetti")

end

function click()

end