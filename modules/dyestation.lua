function define_dyestation()
  api_define_menu_object({
    id = "cnd_dyestation",
    name = "Candle and Bag Dye Station",
    category = "crafting",
    tooltip = "A normal Dye Station.....now with candles!",
    shop_buy = 0,
    shop_sell = 0,
    layout = {
      {7, 17, "Input", {"backpack1", "candles_candle19a"}},
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

  api_define_recipe("t3", MOD_NAME .. "_cnd_dyestation", {
    { item = "dyestation", amount = 1 }
  })
end

function ds_define(menu_id)
  api_define_button(menu_id, "cnd_dye_button_act", 4, 52, "", "cnd_dye_click", "sprites/machines/dye_menu_btnact.png")
  -- api_define_button(menu_id, "cnd_dye_button_inact", 4, 52, "", "cnd_inact_click", "sprites/machines/dye_menu_btn.png")
end

function ds_draw(menu_id)
  api_draw_button(api_gp(menu_id, "cnd_dye_button_act"), false)
end

function ds_change(menu_id)
  -- slots = api_get_slots(menu_id)
  -- if slots[1] ~= nil and slots[2] ~= nil then
  --   api_define_button(menu_id, "cnd_dye_button_act", 4, 52, "", "cnd_dye_click", "sprites/machines/dye_menu_btnact.png")
  --   api_draw_button(api_gp(menu_id, "cnd_dye_button_act"), false)
  -- else
  --   if api_gp(menu_id, "cnd_dye_button_act") ~= nil then
  --     api_remove_gui(menu_id, "cnd_dye_button_act")
  --   end
  -- end
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
---@diagnostic disable-next-line: missing-parameter
    api_create_item("candles_candle" .. string.sub(dye_input["item"], 4) .. "a", 1, player["x"], player["y"])
    api_slot_decr(item_input["id"])
    api_slot_decr(dye_input["id"])
    api_draw_slots(menu_id)
  end
end

function cnd_inact_click(menu_id)
  
end