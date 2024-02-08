-- Candles Mod v0.0

function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

MOD_NAME = "candles"
MOD_VERSION = "0.0"

function define_machines()
  define_dblboiler()
  define_candlemaker()
  define_dyestation()
end

function register()
  return {
    name = MOD_NAME,
    hooks = {"ready", "click", "destroy"},
    modules = {"candle", "dblboiler", "candlemaker", "commands", "npc", "candles_all", "define", "dyestation", "quests"}
  }
end

function init()
  
  if CMOD_DEVMODE == true then
    api_set_devmode(true)
    api_log("init", "Candles loaded!")
    api_define_command('/get_pos', "command_playerpos")
    api_define_command('/testkit', "command_testkit")
    api_define_command('/candles', "command_candles")
    api_define_command('/getstats', "command_getstats")
  end

  define_candles()
  define_machines()
  define_quests()
  define_phoebee()
  return "Success"
end

TREESLIST = {}

function ready()
  api_unlock_quest("candles_quest_1")
end

function destroy(id, x, y, oid)
  if contains(TREESLIST, id) then
    api_log("candles", "Tree destroyed")
  end
end

function click(button, click_type)
  if click_type == "PRESSED"then
    local highlighted = api_get_highlighted("obj")
    if highlighted ~= nil then
      local inst = api_get_inst(highlighted)
      if inst ~= nil and inst["oid"] == "shrub" then
        local chance = math.random(1, 10)
        if chance <= 3 then
---@diagnostic disable-next-line: missing-parameter
          api_create_item("candles_fiber", 1, inst["x"], inst["y"])
        end
      elseif inst ~= nil and string.sub(inst["oid"], 1, 10) == "candles_ca" and CMOD_DEVMODE == true then
---@diagnostic disable-next-line: param-type-mismatch
        api_log("candles", inst)
        for i = 1, NUM_CANDLES do
          if inst["oid"] == "candles_candle" .. i .. "b" or inst["oid"] == "candles_candle" .. i .. "d" then
            api_create_obj("candles_candle" .. i .. "c", inst["x"], inst["y"])
            api_destroy_inst(inst["id"])
          elseif inst["oid"] == "candles_candle" .. i .. "c" then
            api_create_obj("candles_candle" .. i .. "d", inst["x"], inst["y"])
            api_destroy_inst(inst["id"])
          end
        end
      elseif inst ~= nil and CMOD_DEVMODE == true then
        -- api_log("candles", api_gp(inst["id"], "stats"))
---@diagnostic disable-next-line: param-type-mismatch
        api_log("candles", api_get_inst(inst["id"]))
---@diagnostic disable-next-line: param-type-mismatch
        api_log("candles", api_get_inst(inst["menu_id"]))
        api_log("candles", api_gp(inst["menu_id"], "_fields"))
      end
      if inst ~= nil and string.sub(inst["oid"], 1, 4) == "tree" and contains(TREESLIST, inst[id]) == false then
        table.insert(TREESLIST, inst["id"])
      end
    end
  end
end