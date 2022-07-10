function define_machines()
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
      {122, 64, "Liquid Output"},
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

function db_define()
end

function db_draw()
end

function db_change()
end

function db_tick()
end