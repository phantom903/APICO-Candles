function define_dblboiler()
  api_define_menu_object({
    id = "double_boiler",
    name = "Double Boiler",
    category = "Crafting",
    tooltip = "Turns beeswax into liquid candle wax",
    shop_buy = 30,
    shop_sell = 15,
    layout = {
      {8, 17, "Input", {"beeswax"}},
      {8, 40, "Input", {"beeswax"}},
      {31, 17, "Input", {"beeswax"}},
      {31, 40, "Input", {"beeswax"}},
      {31, 63, "Input", {"sawdust2"}},
      {123, 63, "Liquid Output", {"canister1", "canister2"}},
      {7, 89}, {30, 89}, {53, 89}, {76, 89}, {100, 89}, {123, 89}
    },
    buttons = {
      "Help",
      "Target",
      "Close"
    },
    info = {
      {"1. Input Beeswax", "GREEN"},
      {"2. Input Sawdust Bricks", "BLUE"},
      {"3. Candlewax Tank", "YELLOW"},
      {"4. Candlewax Output", "RED"},
      {"5. Extra Storage", "WHITE"}
    },
    tools = {
      "mouse1",
      "hammer1"
    },
    placeable = true,
  }, "sprites/machines/double_boiler_table.png", "sprites/machines/double_boiler_menu.png", {
    define = "db_define",
    draw = "db_draw",
    change = "db_change",
    tick = "db_tick"
  })
  return "Success"
end

function db_define(menu_id)
  api_dp(menu_id, "working", false)
  api_dp(menu_id, "smoking", false)
  
  api_dp(menu_id, "p_start", 0)
  api_dp(menu_id, "p_end", 4)
  api_dp(menu_id, "tank_amount", 0)

  api_dp(menu_id, "s_start", 0)
  api_dp(menu_id, "s_end", 50)

  api_define_gui(menu_id, "db_progress_bar", 50, 21, "db_progress_tooltip", "sprites/dblboil_gui_arrow.png")
  spr = api_get_sprite("sp_candles_db_progress_bar")
  api_dp(menu_id, "db_progress_bar_sprite", spr)

  api_define_tank(menu_id,0,3200,"Candlewax", 123, 14, "large")

  api_define_gui(menu_id, "dbl_boil_smoke", 72, 30, "db_smoke_tooltip", "sprites/dbl_boiler_heat.png")
  spr2 = api_get_sprite("sp_candles_dbl_boil_smoke")
  api_dp(menu_id, "smoke_sprite", spr2)

  fields = {"p_start", "p_end", "tank_amount", "s_start", "s_end"}
  fields = api_sp(menu_id, "_fields", fields)
end

function db_draw(menu_id)
  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "db_progress_bar"))
  spr = api_gp(menu_id, "db_progress_bar_sprite")

  gui2 = api_get_inst(api_gp(menu_id, "dbl_boil_smoke"))
  spr2 = api_gp(menu_id, "smoke_sprite")

  gx = gui["x"] - cam["x"]
  gy = gui["y"] - cam["y"]
  g2x = gui2["x"] - cam["x"]
  g2y = gui2["y"] - cam["y"]
  
  progress = (api_gp(menu_id, "p_start") / api_gp(menu_id, "p_end") * 73)
  smoke = (api_gp(menu_id, "s_start") / api_gp(menu_id, "s_end") * 41)

  api_draw_sprite_part(spr, 2, 0, 0, progress, 10, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end
  
  api_draw_sprite_part(spr2, 2, 0, 41-smoke, 27, smoke, g2x, g2y+(41-smoke))
  api_draw_sprite(spr2, 1, g2x, g2y)
  if api_get_highlighted("ui") == gui2["id"] then
    api_draw_sprite(spr2, 0, g2x, g2y)
  end

  api_draw_tank(api_gp(menu_id, "tank_gui"))
end

function db_change(menu_id)
  output_can = api_get_slot(menu_id, 6)
  if output_can["item"] == "canister1" or output_can["item"] == "canister2" then
    api_slot_drain(menu_id, 6)
  end
 
end

function db_tick(menu_id)
  input_slot = api_slot_match_range(menu_id, {"ANY"}, {1,2,3,4}, true)
  smoke_slot = api_get_slot(menu_id, 5)
  smoke = api_gp(menu_id, "s_start")

  if smoke_slot["count"] > 0 and (api_gp(menu_id, "s_start") < (api_gp(menu_id, "s_end"))) then
    api_slot_decr(smoke_slot["id"])
    if api_gp(menu_id, "s_start") > 48 then 
      api_sp(menu_id, "s_start", 50)
    else
      api_sp(menu_id, "s_start", api_gp(menu_id, "s_start") + 2)
    end
    if api_gp(menu_id, "s_start") > 50 then
      api_sp(menu_id, "s_start", 50)
    end
  end
  wax = api_gp(menu_id, "tank_amount")
  if wax >= 3200 then
    api_sp(menu_id, "working", false)
    api_sp(menu_id, "tank_amount", 3200)
    api_sp(menu_id, "p_start", 0)
    api_sp(menu_id, "error", "")
  elseif input_slot ~= nil then
    api_sp(menu_id, "working", true)
  else
    api_sp(menu_id, "working", false)
  end
  if api_gp(menu_id, "s_start") <= 0 then
    api_sp(menu_id, "smoking", false)
    api_sp(menu_id, "s_start", 0)
  else
    api_sp(menu_id, "smoking", true)
  end
  if (api_gp(menu_id, "working") == true) and (api_gp(menu_id, "smoking") == true) then
    api_sp(menu_id, "p_start", api_gp(menu_id, "p_start") + 0.1)
    api_sp(menu_id, "s_start", api_gp(menu_id, "s_start") - 0.1)
    if api_gp(menu_id, "p_start") >= api_gp(menu_id, "p_end") then
      api_sp(menu_id, "p_start", 0)
      input_slot = api_slot_match_range(menu_id, {"ANY"}, {1,2,3,4}, true)
      if input_slot ~= nil then
        api_slot_decr(input_slot["id"])
        api_sp(menu_id, "tank_amount", api_gp(menu_id, "tank_amount") + 200)
        api_sp(menu_id, "s_start", api_gp(menu_id, "s_start") - 1)
        input_slot = api_slot_match_range(menu_id, {"ANY"}, {1,2,3,4}, true)
        if input_slot == nil then api_sp(menu_id, "working", false) end
        if api_gp(menu_id, "s_start") <= 0 then
          api_sp(menu_id, "s_start", 0)
          api_sp(menu_id, "smoking", false)
        end
      end
    end
  end
end

function db_progress_tooltip(menu_id)
  progress = math.floor((api_gp(menu_id, "p_start") / api_gp(menu_id, "p_end")) * 100)
  percent = tostring(progress) .. "%"
  return {
    {"Progress", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function db_smoke_tooltip(menu_id)
  smoke = math.floor((api_gp(menu_id, "s_start") / api_gp(menu_id, "s_end")) * 100)
  percent = tostring(smoke) .. "%"
  return {
    {"Heat", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end