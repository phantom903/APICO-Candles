function command_playerpos(args)
  playerpos = api_get_player_position()
  api_log("position: " .. playerpos["x"] .. ", " .. playerpos["y"])
end

function command_testkit(args)
  testkit = {
    {id = "candles_double_boiler" , num = 1},
    {id = "candles_candle_maker", num = 1},
    {id = "heater", num = 1},
    {id = "cooler", num = 1},
    {id ="canister2", num = 1},
    {id = "sawdust2", num = 99},
    {id = "sawdust2", num = 99},
    {id = "beeswax", num = 99},
    {id = "snowball", num = 99}
  }
  for _,v in pairs(testkit) do
    api_use_item(v["id"], api_use_total(v["id"]))
    api_give_item(v["id"], v["num"])
  end
end