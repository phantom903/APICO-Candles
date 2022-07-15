function command_playerpos(args)
  playerpos = api_get_player_position()
  api_log("position: " .. playerpos["x"] .. ", " .. playerpos["y"])
end