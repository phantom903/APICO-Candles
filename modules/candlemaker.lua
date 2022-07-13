function define_candlemaker()
  api_define_menu_object({
    id = "candle_maker",
    name = "Candle Maker",
    category = "Crafting",
    tooltip = "Turns liquid candle wax into candles",
    shop_buy = 30,
    shop_sell = 15,
    layout = {
     {7, 63, "Liquid Input", {"canister1", "canister2"}},
     {30, 63, "Input", {"candles_cndwick"}},
     {122, 17, "Output"},
     {7, 89}, {30, 89}, {53, 89}, {76, 89}, {99, 89}, {122, 89}
    },
    buttons = {
      "Help",
      "Target",
      "Close"
    },
    info = {
      {"1. Stored Liquid Candle Wax", "YELLOW"},
      {"2. Candle Wax Input", "GREEN"},
      {"3. Candle Wick Input", "BLUE"},
      {"4. Candles Output", "RED"},
      {"5. Extra Storage", "WHITE"}
    },
    tools = {
      "mouse1",
      "hammer1"
    },
    placeable = true,
  }, "sprites/machines/candle_maker_table.png", "sprites/machines/candle_maker_menu_final007.png", {
    define = "cm_define",
    draw = "cm_draw",
    change = "cm_change",
    tick = "cm_tick"
  })

  return "Success"
end

function cm_define(menu_id)
  api_dp(menu_id, "working", false)
  api_dp(menu_id, "p_start", 0)
  api_dp(menu_id, "p_end", 1)

  api_define_gui(menu_id, "cm_progress_bar", 28, 21, "candle_maker_bar_gui_tooltip", "sprites/cnd_maker_gui_arrow.png")

  spr = api_get_sprite("sp_candles_cm_progress_bar")
  api_dp(menu_id, "progress_bar_sprite", spr)

  fields = {"p_start", "p_end"}
  fields = api_sp(menu_id, "_fields", fields)
 
  api_define_tank(menu_id, 0, 3200, "Candlewax", 7, 14, "large")
end

function cm_draw(menu_id)
  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "cm_progress_bar"))
  spr = api_gp(menu_id, "progress_bar_sprite")
  gx = gui["x"] - cam["x"]
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "p_start") / api_gp(menu_id, "p_end") * 91)
  api_draw_sprite_part(spr, 2, 0, 0, progress, 10, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  api_draw_tank(api_gp(menu_id, "tank_gui"))
end

function cm_change(menu_id)
  -- input_slot = api_slot_match_range(menu_id, {"ANY"}, {1,2,3,4,5,6}, true)
  -- if input_slot ~= nil then
  --   api_sp(menu_id, "working", true)
  -- else
  --   api_sp(menu_id, "working", false)
  -- end
  input_can = api_get_slot(menu_id, 1)
  if input_can["item"] == "canister1" or input_can["item"] == "canister2" then
    api_slot_fill(menu_id, 1)
  end
end

function cm_tick(menu_id)
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

function candle_maker_bar_gui_tooltip(menu_id)
  progress = math.floor((api_gp(menu_id, "p_start") / api_gp(menu_id, "p_end")) * 100)
  percent = tostring(progress) .. "%"
  return {
    {"Progress", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end