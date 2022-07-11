function define_dblboiler()
  api_define_menu_object({
    id = "double_boiler",
    name = "Double Boiler",
    category = "Crafting",
    tooltip = "Turns beeswax into liquid candle wax",
    shop_buy = 30,
    shop_sell = 15,
    layout = {
      {8, 18, "Input", {"beeswax"}},
      {8, 41, "Input", {"beeswax"}},
      {8, 64, "Input", {"beeswax"}},
      {31, 18, "Input", {"beeswax"}},
      {31, 41, "Input", {"beeswax"}},
      {31, 64, "Input", {"beeswax"}},
--      {122, 64, "Liquid Output"},
      {122, 64, "Output"},
      {8, 90}, {30, 90}, {53, 90}, {76, 90}, {99, 90}, {122, 90}
    },
    buttons = {
      "Help",
      "Target",
      "Close"
    },
    info = {
      {"1. Input Resource", "GREEN"},
      {"2. Liquid Candlewax Output", "RED"},
      {"3. Extra Storage", "WHITE"}
    },
    tools = {
      "mouse1",
      "hammer1"
    },
    placeable = true,
  }, "sprites/machines/double_boiler_table.png", "sprites/machines/double_boiler_edited-dp.png", {
    define = "db_define",
    draw = "db_draw",
    change = "db_change",
    tick = "db_tick"
  })

  return "Success"
end

function db_define(menu_id)
  api_dp(menu_id, "working", false)
  api_dp(menu_id, "p_start", 0)
  api_dp(menu_id, "p_end", 1)

  api_define_gui(menu_id, "progress_bar", 55, 21, "dbl_boiler_bar_gui_tooltip", "sprites/dblboil_gui_arrow.png")

  spr = api_get_sprite("sp_candles_progress_bar")
  api_dp(menu_id, "progress_bar_sprite", spr)

  fields = {"p_start", "p_end"}
  fields = api_sp(menu_id, "_fields", fields)
 
end

function db_draw(menu_id)
  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "progress_bar"))
  spr = api_gp(menu_id, "progress_bar_sprite")
  gx = gui["x"] - cam["x"]
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "p_start") / api_gp(menu_id, "p_end") * 68)
  api_draw_sprite_part(spr, 2, 0, 0, progress, 10, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end
end

function db_change(menu_id)
  input_slot = api_slot_match_range(menu_id, {"ANY"}, {1,2,3,4,5,6}, true)
  if input_slot ~= nil then
    api_sp(menu_id, "working", true)
  else
    api_sp(menu_id, "working", false)
  end
end

function db_tick(menu_id)
  if api_gp(menu_id, "working") == true then
    api_sp(menu_id, "p_start", api_gp(menu_id, "p_start") + 0.1)
    if api_gp(menu_id, "p_start") >= api_gp(menu_id, "p_end") then
      api_sp(menu_id, "p_start", 0)
      input_slot = api_slot_match_range(menu_id, {"ANY"}, {1,2,3,4,5,6}, true)
      if input_slot ~= nil then
        api_slot_decr(input_slot["id"])
        output_slot = api_slot_match_range(menu_id, {""}, {7}, true)
        if output_slot ~= nil then
          if output_slot["item"] == "" then
            api_slot_set(output_slot["id"], "candles_cndunlit1", 1)
          else
            api_slot_incr(output_slot["id"])
          end
        end
        input_slot = api_slot_match_range(menu_id, {"ANY"}, {1,2,3,4,5,6}, true)
        if input_slot == nil then api_sp(menu_id, "working", false) end
      end
    end
  end
end

function dbl_boiler_bar_gui_tooltip(menu_id)
  progress = math.floor((api_gp(menu_id, "p_start") / api_gp(menu_id, "p_end")) * 100)
  percent = tostring(progress) .. "%"
  return {
    {"Progress", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end