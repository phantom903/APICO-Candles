function define_dyestation()
  api_define_menu_object({
    id = "candle_dyestation",
    name = "Dye Station",
    category = "crafting",
    tooltip = "A normal Dye Station.....now with candles!",
    shop_buy = 0,
    shop_sell = 0,
    layout = {
      {7, 17, "Input", {"backpackX", "candles_candle1a"}},
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
  
end

function ds_change(menu_id)
  
end

function ds_tick(menu_id)
  
end