  -- machine_pos = api_get_inst(menu_id)
  -- local_objs = api_get_inst_in_circle("menu_obj", machine_pos["x"], machine_pos["y"], (6*16))
  -- for _, v in pairs(local_objs) do
  --   if v["oid"] == "heater" then
  --     -- api_log("candles: ", api_gp(v["menu_id"], "b_time"))
  --     api_log("candles: ", api_gp(v["menu_id"], "working"))
  --   end
  -- end
function define_debugger()
  
  api_define_menu_object({
    id = "debugger903",
    name = "Phantom 903's debug box",
    tooltip = "Logs properties of nearby objects to the console",
    layout = {},
    buttons = {
      "Help",
      "Target",
      "Close"
    },
    info = {},
    tools = {
      "mouse1",
      "hammer2"
    },
    placeable = true
  }, "sprites/debug/debugger_obj.png", "sprites/debug/debug_menu.png")

end