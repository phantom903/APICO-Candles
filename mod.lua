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
    hooks = {"ready", "click", "draw"},
    modules = {"candle", "dblboiler", "candlemaker", "commands", "npc", "candles_all", "define"}
  }
end

function init()
  
  if CMOD_DEVMODE == true then
    api_set_devmode(true)
    api_log("init", "Candles loaded!")
    api_define_command('/get_pos', "command_playerpos")
    api_define_command('/testkit', "command_testkit")
  end

  define_candles()
  define_machines()
  -- define_recipe_book()
  return "Success"
end

function ready()

  friend = api_get_menu_objects(nil, "npc878")
  if #friend == 0 then
    player = api_get_player_position()
    api_create_obj("npc878", player["x"] + 16, player["y"] - 32)
  end
  -- create_recipe_book()
end

function draw()
end

function click()
  highlighted = api_get_highlighted("obj")
  if highlighted ~= nil then
    inst = api_get_inst(highlighted)
    if inst["oid"] == "shrub" then
      chance = math.random(1, 10)
      if chance == 1 then
        api_create_item("candles_fiber", 1, inst["x"], inst["y"])
      end
    end
  end
end

-- function worldgen(before_objects)
--   if before_objects then
--     for x = 1200, 1360, 16 do
--       for y = 1200, 1360, 16 do
--         api_set_ground("grass1", x, y)
--       end
--     end
--   end
-- end