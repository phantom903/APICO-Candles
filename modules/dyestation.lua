function define_dyestation()
  api_define_menu_object({
    id = "candle_dyestation",
    name = "Dye Station",
    category = "crafting",
    tooltip = "A normal Dye Station.....now with candles!",
    shop_buy = 0,
    shop_sell = 0,
    layout = {
      {7, 17, "Input", {"backpack1", "candles_candle1a"}},
      {38, 17, "Input", {"dyeX"}}
    },
    buttons = {
      "Help",
      "Target",
      "Move",
      "Close"
    },
    info = {
      {"1. Plain candle, or backpack", "GREEN"},
      {"2. Dye Input", "GREEN"}
    },
    tools = {
      "mouse1",
      "hammer1"
    },
    placeable = true,
  }, "sprites/machines/cnd_dyestation.png", "sprites/machines/cnd_dye_menu.png", {
    define = "ds_define",
    draw = "ds_draw",
    change = "ds_change",
    tick = "ds_tick"
  })
end

function ds_define(menu_id)
  
end

function ds_draw(menu_id)
  api_define_button(menu_id, "cnd_dye_button", 4, 52, "cnd_dye_click", "sprite/dye_menu_btn.png")
end

function ds_change(menu_id)
  local input_slot = api_get_slot(menu_id, 1)
  local old_stats = input_slot["stats"]
  api_log("candles", old_stats)
  old_stats["dye"] = 3
  api_log("candles", old_stats)
  api_slot_set(input_slot["id"], "backpack1", 1, old_stats)
  -- api_slot_redraw(input_slot["id"])
end

function ds_tick(menu_id)
  
end

function cnd_dye_click(menu_id)
  local item_input = api_get_slot(menu_id, 1)
  local dye_input = api_get_slot(menu_id, 2)
end