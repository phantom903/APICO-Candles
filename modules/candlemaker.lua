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
     {30, 63, "Input", {MOD_NAME .. "_cndwick"}},
     {76, 17, "Input", {MOD_NAME .. "_cndmold1", MOD_NAME .. "_cndmold2", MOD_NAME .. "_cndmold3"}},
     {99, 17, "Input", {MOD_NAME .. "_cndmold1", MOD_NAME .. "_cndmold2", MOD_NAME .. "_cndmold3"}},
     {122, 17, "Input", {MOD_NAME .. "_cndmold1", MOD_NAME .. "_cndmold2", MOD_NAME .. "_cndmold3"}},
     {145, 17, "Input", {MOD_NAME .. "_cndmold1", MOD_NAME .. "_cndmold2", MOD_NAME .. "_cndmold3"}},
     {76, 63, "Output"},
     {99, 63, "Output"},
     {122, 63, "Output"},
     {145, 63, "Output"},
     {7, 89}, {30, 89}, {53, 89}, {76, 89}, {99, 89}, {122, 89}, {145, 89}
    },
    buttons = {
      "Help",
      "Target",
      "Close"
    },
    info = {
      {"1. Candle Wax Input", "GREEN"},
      {"2. Candle Wick Input", "GREEN"},
      {"3. Stored Liquid Candle Wax", "YELLOW"},
      {"4. Candle Mold Slots", "GREEN"},
      {"5. Candles Output", "RED"},
      {"6. Extra Storage", "BLUE"}
    },
    tools = {
      "mouse1",
      "hammer1"
    },
    placeable = true,
  }, "sprites/machines/candle_maker_table.png", "sprites/machines/candle_maker_table_new_V2.png", {
    define = "cm_define",
    draw = "cm_draw",
    change = "cm_change",
    tick = "cm_tick"
  })

  return "Success"
end

function cm_define(menu_id)
  api_dp(menu_id, "wicks_present", false)
  api_dp(menu_id, "working", false)
  api_dp(menu_id, "p_start", 0)
  api_dp(menu_id, "p_end", 3)
  api_dp(menu_id, "d1_start", 0)
  api_dp(menu_id, "d1_end", 2)
  api_dp(menu_id, "d2_start", 0)
  api_dp(menu_id, "d2_end", 2)
  api_dp(menu_id, "d3_start", 0)
  api_dp(menu_id, "d3_end", 2)
  api_dp(menu_id, "d4_start", 0)
  api_dp(menu_id, "d4_end", 2)
  api_dp(menu_id, "tank_amount", 0)

  api_define_gui(menu_id, "cm_progress_bar", 26, 20, "cm_progress_tooltip", "sprites/machines/cnd_maker_gui_arrow.png")
  spr = api_get_sprite("sp_candles_cm_progress_bar")
  api_dp(menu_id, "cm_progress_bar_sprite", spr)
  
  api_define_gui(menu_id, "cm_down_bar1", 79, 36, "cm_down1_tooltip", "sprites/machines/cnd_maker_down_gui_arrow.png")
  spr = api_get_sprite("sp_candles_cm_down_bar1")
  api_dp(menu_id, "cm_down_bar1_sprite", spr)

  api_define_gui(menu_id, "cm_down_bar2", 102, 36, "cm_down2_tooltip", "sprites/machines/cnd_maker_down_gui_arrow.png")
  spr = api_get_sprite("sp_candles_cm_down_bar2")
  api_dp(menu_id, "cm_down_bar2_sprite", spr)

  api_define_gui(menu_id, "cm_down_bar3", 125, 36, "cm_down3_tooltip", "sprites/machines/cnd_maker_down_gui_arrow.png")
  spr = api_get_sprite("sp_candles_cm_down_bar3")
  api_dp(menu_id, "cm_down_bar3_sprite", spr)

  api_define_gui(menu_id, "cm_down_bar4", 148, 36, "cm_down4_tooltip", "sprites/machines/cnd_maker_down_gui_arrow.png")
  spr = api_get_sprite("sp_candles_cm_down_bar4")
  api_dp(menu_id, "cm_down_bar4_sprite", spr)

  fields = {
    "p_start", "p_end", "d1_start", "d1_end", "working", "wicks_present",
    "d2_start", "d2_end", "d3_start", "d3_end", "d4_start", "d4_end"
  }
  fields = api_sp(menu_id, "_fields", fields)
 
  api_define_tank(menu_id, 0, 3200, "Candlewax", 7, 14, "large")
  api_define_button(menu_id, "cnd_engage", 27, 34, "", "cnd_engage_click", "sprites/machines/cnd_mkr_btn.png")
end

function cm_draw(menu_id)
  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "cm_progress_bar"))
  spr = api_gp(menu_id, "cm_progress_bar_sprite")
  gx = gui["x"] - cam["x"]
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "p_start") / api_gp(menu_id, "p_end") * 45)
  api_draw_sprite_part(spr, 2, 0, 0, progress, 10, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "cm_down_bar1"))
  spr = api_gp(menu_id, "cm_down_bar1_sprite")
  gx = gui["x"] - cam["x"]
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "d1_start") / api_gp(menu_id, "d1_end") * 24)
  api_draw_sprite_part(spr, 2, 0, 0, 10, progress, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "cm_down_bar2"))
  spr = api_gp(menu_id, "cm_down_bar2_sprite")
  gx = gui["x"] - cam["x"]
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "d2_start") / api_gp(menu_id, "d2_end") * 24)
  api_draw_sprite_part(spr, 2, 0, 0, 10, progress, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "cm_down_bar3"))
  spr = api_gp(menu_id, "cm_down_bar3_sprite")
  gx = gui["x"] - cam["x"]
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "d3_start") / api_gp(menu_id, "d3_end") * 24)
  api_draw_sprite_part(spr, 2, 0, 0, 10, progress, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "cm_down_bar4"))
  spr = api_gp(menu_id, "cm_down_bar4_sprite")
  gx = gui["x"] - cam["x"]
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "d4_start") / api_gp(menu_id, "d4_end") * 24)
  api_draw_sprite_part(spr, 2, 0, 0, 10, progress, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  api_draw_tank(api_gp(menu_id, "tank_gui"))
  api_draw_button(api_gp(menu_id, "cnd_engage"), false)
end

function cm_change(menu_id)
  -- wick_slot = api_get_slot(menu_id, 2)
  -- if wick_slot ~= nil then
  --   api_sp(menu_id, "wicks_present", true)
  -- else
  --   api_sp(menu_id, "wicks_present", false)
  -- end
  input_can = api_get_slot(menu_id, 1)
  if input_can["item"] == "canister1" or input_can["item"] == "canister2" then
    api_slot_fill(menu_id, 1)
  end
  -- if api_gp(menu_id, "wicks_present") == true and api_dp(menu_id, "tank_amount") >= 200 then
  --   api_sp(menu_id, "working", true)
  -- end
end

function cm_tick(menu_id)
  -- if api_gp(menu_id, "working") == true then
  --   api_sp(menu_id, "p_start", api_gp(menu_id, "p_start") + 0.1)
  --   if api_gp(menu_id, "p_start") >= api_gp(menu_id, "p_end") then
  --     api_sp(menu_id, "p_start", 0)
  --     input_slot = api_slot_match_range(menu_id, {"ANY"}, {1,2,3,4,5,6}, true)
  --     if input_slot ~= nil then
  --       api_slot_decr(input_slot["id"])
  --       output_slot = api_slot_match_range(menu_id, {""}, {7}, true)
  --       if output_slot ~= nil then
  --         if output_slot["item"] == "" then
  --           api_slot_set(output_slot["id"], "candles_cndunlit1", 1)
  --         else
  --           api_slot_incr(output_slot["id"])
  --         end
  --       end
  --       input_slot = api_slot_match_range(menu_id, {"ANY"}, {1,2,3,4,5,6}, true)
  --       if input_slot == nil then api_sp(menu_id, "working", false) end
  --     end
  --   end
  -- end
end

function cm_progress_tooltip(menu_id)
  progress = math.floor((api_gp(menu_id, "p_start") / api_gp(menu_id, "p_end")) * 100)
  percent = tostring(progress) .. "%"
  return {
    {"Cooling", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function cm_down1_tooltip(menu_id)
  progress = math.floor((api_gp(menu_id, "d1_start") / api_gp(menu_id, "d1_end")) * 100)
  percent = tostring(progress) .. "%"
  return {
    {"Setting", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function cm_down2_tooltip(menu_id)
  progress = math.floor((api_gp(menu_id, "d2_start") / api_gp(menu_id, "d2_end")) * 100)
  percent = tostring(progress) .. "%"
  return {
    {"Setting", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function cm_down3_tooltip(menu_id)
  progress = math.floor((api_gp(menu_id, "d3_start") / api_gp(menu_id, "d3_end")) * 100)
  percent = tostring(progress) .. "%"
  return {
    {"Setting", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function cm_down4_tooltip(menu_id)
  progress = math.floor((api_gp(menu_id, "d4_start") / api_gp(menu_id, "d4_end")) * 100)
  percent = tostring(progress) .. "%"
  return {
    {"Setting", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function cnd_engage_click(menu_id)
  
end