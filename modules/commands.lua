function command_playerpos(args)
  local playerpos = api_get_player_position()
  api_log("candles", "position: " .. playerpos["x"] .. ", " .. playerpos["y"])
end

function command_testkit(args)
  local testkit = {
    {id = "candles_double_boiler" , num = 1},
    {id = "candles_candle_maker", num = 1},
    {id = "heater", num = 1},
    {id = "cooler", num = 1},
    {id ="canister2", num = 1},
    {id = "sawdust2", num = 99},
    {id = "sawdust2", num = 99},
    {id = "beeswax", num = 99},
    {id = "snowball", num = 99},
    {id = "candles_cndwick", num = 99},
    {id = "backpack1", num = 1},
    {id = "candles_cnd_dyestation", num = 1}
  }
  for _,v in pairs(testkit) do
    api_use_item(v["id"], api_use_total(v["id"]))
    api_give_item(v["id"], v["num"])
  end
end

function command_candles(args)
  local player = api_get_player_position()
  api_create_obj("crate2", player["x"] + 8, player["y"] - 16)
  local cndcrate = api_get_menu_objects(nil, "crate2")
  local slots = api_get_slots(cndcrate[1]["menu_id"])
  for i = 1,19 do
    api_slot_set(slots[i]["id"], "candles_candle" .. i .. "a", 99)
  end
end

function command_getstats(args)
  local player = api_get_player_position()
  local obj_to_find = args[1]
  local objs = api_get_objects(nil, obj_to_find)
---@diagnostic disable-next-line: param-type-mismatch
  api_create_log("candles", objs[1])
end