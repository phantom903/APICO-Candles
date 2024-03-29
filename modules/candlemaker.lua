function define_candlemaker()
  api_define_menu_object({
    id = "candle_maker",
    name = "Candle Maker",
    category = "Crafting",
    tooltip = "Turns liquid candle wax into candles",
    shop_buy = CNDMAKERBUY,
    shop_sell = CNDMAKERSELL,
    layout = {
     {7, 63, "Liquid Input", {"canister1", "canister2"}},
     {30, 63, "Input", {MOD_NAME .. "_cndwick"}},
     {76, 17, "Input", CND_MOLDS},
     {99, 17, "Input", CND_MOLDS},
     {122, 17, "Input", CND_MOLDS},
     {145, 17, "Input", CND_MOLDS},
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
  }, "sprites/machines/candle_maker_table.png", "sprites/machines/candle_maker_menu.png", {
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
  api_dp(menu_id, "p_end", CM_PROGRESS_MAX)
  api_dp(menu_id, "d1_start", 0)
  api_dp(menu_id, "d1_end", CM_DOWNARROW_MAX)
  api_dp(menu_id, "d2_start", 0)
  api_dp(menu_id, "d2_end", CM_DOWNARROW_MAX)
  api_dp(menu_id, "d3_start", 0)
  api_dp(menu_id, "d3_end", CM_DOWNARROW_MAX)
  api_dp(menu_id, "d4_start", 0)
  api_dp(menu_id, "d4_end", CM_DOWNARROW_MAX)
  api_dp(menu_id, "d1_run", false)
  api_dp(menu_id, "d2_run", false)
  api_dp(menu_id, "d3_run", false)
  api_dp(menu_id, "d4_run", false)
  api_dp(menu_id, "tank_amount", 0)
  api_dp(menu_id, "engaged", false)
  api_dp(menu_id, "runs", 0)

  api_define_gui(menu_id, "cm_progress_bar", 26, 20, "cm_progress_tooltip", "sprites/machines/cnd_maker_gui_arrow.png")
  local spr = api_get_sprite("sp_candles_cm_progress_bar")
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

  local fields = {
    "p_start", "p_end", "d1_start", "d1_end", "working", "engaged",
    "d2_start", "d2_end", "d3_start", "d3_end", "d4_start", "d4_end",
    "d1_run", "d2_run", "d3_run", "d4_run", "runs"
  }
  api_sp(menu_id, "_fields", fields)
 
  api_define_tank(menu_id, 0, CM_WAX_CAPACITY, "Candlewax", 7, 14, "large")
  api_define_button(menu_id, "cnd_engage", 27, 34, "", "cnd_engage_click", "sprites/machines/cnd_mkr_btn.png")
end

function cm_draw(menu_id)
  local cam = api_get_cam()
  local gui = api_get_inst(api_gp(menu_id, "cm_progress_bar"))
  local spr = api_gp(menu_id, "cm_progress_bar_sprite")
  ---@diagnostic disable-next-line: need-check-nil
  local gx = gui["x"] - cam["x"]
  ---@diagnostic disable-next-line: need-check-nil
  local gy = gui["y"] - cam["y"]
  local progress = (api_gp(menu_id, "p_start") / api_gp(menu_id, "p_end") * 45)
  api_draw_sprite_part(spr, 2, 0, 0, progress, 10, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  ---@diagnostic disable-next-line: need-check-nil
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "cm_down_bar1"))
  spr = api_gp(menu_id, "cm_down_bar1_sprite")
  ---@diagnostic disable-next-line: need-check-nil
  gx = gui["x"] - cam["x"]
  ---@diagnostic disable-next-line: need-check-nil
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "d1_start") / api_gp(menu_id, "d1_end") * 24)
  api_draw_sprite_part(spr, 2, 0, 0, 10, progress, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  ---@diagnostic disable-next-line: need-check-nil
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "cm_down_bar2"))
  spr = api_gp(menu_id, "cm_down_bar2_sprite")
  ---@diagnostic disable-next-line: need-check-nil
  gx = gui["x"] - cam["x"]
  ---@diagnostic disable-next-line: need-check-nil
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "d2_start") / api_gp(menu_id, "d2_end") * 24)
  api_draw_sprite_part(spr, 2, 0, 0, 10, progress, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  ---@diagnostic disable-next-line: need-check-nil
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "cm_down_bar3"))
  spr = api_gp(menu_id, "cm_down_bar3_sprite")
  ---@diagnostic disable-next-line: need-check-nil
  gx = gui["x"] - cam["x"]
  ---@diagnostic disable-next-line: need-check-nil
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "d3_start") / api_gp(menu_id, "d3_end") * 24)
  api_draw_sprite_part(spr, 2, 0, 0, 10, progress, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  ---@diagnostic disable-next-line: need-check-nil
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  cam = api_get_cam()
  gui = api_get_inst(api_gp(menu_id, "cm_down_bar4"))
  spr = api_gp(menu_id, "cm_down_bar4_sprite")
  ---@diagnostic disable-next-line: need-check-nil
  gx = gui["x"] - cam["x"]
  ---@diagnostic disable-next-line: need-check-nil
  gy = gui["y"] - cam["y"]
  progress = (api_gp(menu_id, "d4_start") / api_gp(menu_id, "d4_end") * 24)
  api_draw_sprite_part(spr, 2, 0, 0, 10, progress, gx, gy)
  api_draw_sprite(spr, 1, gx, gy)
  ---@diagnostic disable-next-line: need-check-nil
  if api_get_highlighted("ui") == gui["id"] then
    api_draw_sprite(spr, 0, gx, gy)
  end

  api_draw_tank(api_gp(menu_id, "tank_gui"))
  api_draw_button(api_gp(menu_id, "cnd_engage"), false)
end

function cm_change(menu_id)
  local input_can = api_get_slot(menu_id, 1)
  if input_can["item"] == "canister1" or input_can["item"] == "canister2" then
    api_slot_fill(menu_id, 1)
  end
  -- local inslot = api_slot_match_range(menu_id, {"ANY"}, {3,4,5,6}, true)
  -- api_log(inslot)
end

function cm_tick(menu_id)
  local machine_mod = CM_PROGRESS_INCR
  local down_mod = CM_DOWNARROW_INCR
  local local_objs = api_get_inst_in_circle("menu_obj", api_gp(menu_id, "obj_x"), api_gp(menu_id, "obj_y"), (6*16))
  for _, v in pairs(local_objs) do
    if v["oid"] == "cooler" and api_gp(v["menu_id"], "working") == true then
      machine_mod = CM_PROGRESS_INCR * CM_COOLER_BOOST
      down_mod = CM_DOWNARROW_INCR * CM_COOLER_BOOST
      -- api_create_log("candles", "Cooler on")
    end
  end

  if api_gp(menu_id, "engaged") == true then
    if api_gp(menu_id, "p_start") < api_gp(menu_id, "p_end") then
      api_sp(menu_id, "p_start",(api_gp(menu_id, "p_start") + (machine_mod / api_gp(menu_id, "runs"))))
    end
    if api_gp(menu_id, "p_start") >= api_gp(menu_id, "p_end") then
      api_sp(menu_id, "runs", 0)
      for slot = 3,6 do
        if api_get_slot(menu_id, slot)["total_health"] > 0 and api_gp(menu_id,"d" .. slot -2 .."_run") == true then
        -- if api_get_slot(menu_id, slot)["count"] > 0 then  
          if api_gp(menu_id, "d" .. slot-2 .."_start") < api_gp(menu_id, "d" .. slot-2 .. "_end") then
            api_sp(menu_id, "d" .. slot-2 .."_start",(api_gp(menu_id, "d" .. slot-2 .."_start") + down_mod))
          end
          if api_gp(menu_id, "d" .. slot-2 .."_start") >= api_gp(menu_id, "d" .. slot-2 .. "_end") then
            local outslot = api_get_slot(menu_id, slot + 4)
            api_sp(menu_id,"d" .. slot -2 .."_run", false)
            api_sp(menu_id, "d" .. slot-2 .."_start", 0)
            local inslot = api_get_slot(menu_id, slot)
            api_sp(inslot["id"], "current_health", api_gp(inslot["id"], "current_health") - 1)
            if api_gp(inslot["id"], "current_health") <= 0  then
              api_slot_clear(inslot["id"])
            end
            if outslot["count"] > 0 then
              api_slot_incr(outslot["id"], 1)
            else
              api_slot_set(outslot["id"], "candles_candle19a", 1)
            end
          end
        end
      end
      if api_gp(menu_id, "d1_run") == false and api_gp(menu_id, "d2_run") == false and api_gp(menu_id, "d3_run") == false and api_gp(menu_id, "d4_run") == false then
        api_sp(menu_id, "p_start", 0)
        api_sp(menu_id, "engaged", false)
        api_create_log("candles", "disengaged")
      end
    end
  end
end

function cm_progress_tooltip(menu_id)
  local progress = math.floor((api_gp(menu_id, "p_start") / api_gp(menu_id, "p_end")) * 100)
  local percent = tostring(progress) .. "%"
  return {
    {"Filling", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function cm_down1_tooltip(menu_id)
  local progress = math.floor((api_gp(menu_id, "d1_start") / api_gp(menu_id, "d1_end")) * 100)
  local percent = tostring(progress) .. "%"
  return {
    {"Setting", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function cm_down2_tooltip(menu_id)
  local progress = math.floor((api_gp(menu_id, "d2_start") / api_gp(menu_id, "d2_end")) * 100)
  local percent = tostring(progress) .. "%"
  return {
    {"Setting", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function cm_down3_tooltip(menu_id)
  local progress = math.floor((api_gp(menu_id, "d3_start") / api_gp(menu_id, "d3_end")) * 100)
  local percent = tostring(progress) .. "%"
  return {
    {"Setting", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function cm_down4_tooltip(menu_id)
  local progress = math.floor((api_gp(menu_id, "d4_start") / api_gp(menu_id, "d4_end")) * 100)
  local percent = tostring(progress) .. "%"
  return {
    {"Setting", "FONT_WHITE"},
    {percent, "FONT_BGREY"}
  }
end

function cnd_engage_click(menu_id)
  local num_candles = 0
  if api_gp(menu_id, "engaged") == false then
    local filled_slots = api_slot_match_range( menu_id, CND_MOLDS, {3, 4, 5, 6}, false)
    local slot_nums = #filled_slots
    local wick_slot = api_get_slot(menu_id, 2)
    local wick_nums = wick_slot["count"]
    local wax_num = api_gp(menu_id, "tank_amount")
    if wick_nums >= slot_nums and slot_nums <= (wax_num/CM_WAX_PER_CANDLE) then
      num_candles = slot_nums
      api_sp(menu_id, "runs", num_candles)
      api_slot_decr(wick_slot["id"], num_candles)
      api_sp(menu_id, "tank_amount", api_gp(menu_id, "tank_amount") - (num_candles * CM_WAX_PER_CANDLE))
      api_sp(menu_id, "engaged", true)
    end
    for slot = 1,4 do
      local rslot = api_get_slot(menu_id, slot + 2)
      if rslot["total_health"] > 0 then
        api_sp(menu_id, "d" .. slot .. "_run", true)
      end
    end
  end
  
end