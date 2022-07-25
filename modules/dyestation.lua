function define_dyestation()
  api_define_menu_object({
    id = "candle_dyestation",
    name = "Dye Station",
    category = "crafting",
    tooltip = "A normal Dye Station.....now with candles!",
    shop_buy = 0,
    shop_sell = 0,
    layout = {
      {7, 17, "Input", {"backpack1", "candles_candle0a"}},
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
  api_define_button(menu_id, "cnd_dye_button", 4, 52, "", "cnd_dye_click", "sprites/machines/dye_menu_btn.png")
end

function ds_draw(menu_id)
  api_draw_button(api_gp(menu_id, "cnd_dye_button"), false)
end

function ds_change(menu_id)

end

function ds_tick(menu_id)
  
end

function cnd_dye_click(menu_id)
  local item_input = api_get_slot(menu_id, 1)
  local dye_input = api_get_slot(menu_id, 2)
  if item_input["item"] == "backpack1" and dye_input["count"] > 0 then
    local old_stats = item_input["stats"]
    old_stats["dye"] = tonumber(string.sub(dye_input["item"], 4))
    api_slot_set(item_input["id"], "backpack1", 1, old_stats)
    api_slot_decr(dye_input["id"])
    api_draw_slots(menu_id)
  elseif string.sub(item_input["item"],1, 10) == "candles_ca" then
    local player = api_get_player_position()
    api_create_item("candles_candle" .. string.sub(dye_input["item"], 4) .. "a", 1, player["x"], player["y"])
    api_slot_decr(item_input["id"])
    api_slot_decr(dye_input["id"])
    api_draw_slots(menu_id)
  end
end