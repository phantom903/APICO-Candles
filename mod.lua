-- Candles Mod v0.0

MOD_NAME = "candles"
MOD_VERSION = "0.0"

function define_machines()
  define_dblboiler()
  define_candlemaker()
end

function register()
  return {
    name = MOD_NAME,
    hooks = {"ready", "click"},
    modules = {"candle", "dblboiler", "candlemaker"}
  }
end

function init() 

  -- turn on devmode
  api_set_devmode(true)

  api_log("init", "Candles loaded!")

  define_candles()
  define_machines()
  -- define our mod workbench labels (for our item's recipe)
  -- api_define_workbench("Candle Mod", {
  --   t1 = "Sample Tab 1",
  --   t2 = "Sample Tab 2",
  --   t3 = "Sample Tab 3",
  --   t4 = "Sample Tab 4",
  --   t5 = "Sample Tab 5",
  -- })
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