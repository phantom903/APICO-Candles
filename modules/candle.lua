function define_candle_items()
  api_define_item({
    id = "fiber",
    name = "Fiber",
    category = "Resource",
    tooltip = "Strands of fiber found in a shrub, I wonder if they can be used for anything?",
    shop_key = false,
    shop_buy = 10,
    shop_sell = 0
  }, "sprites/candle/plant_fiber.png")

  api_define_item({
    id = "cndwick",
    name = "Candle Wick",
    category = "Resource",
    tooltip = "A Candle wick made from fibers",
    shop_key = false,
    shop_buy = 10,
    shop_sell = 0
  }, "sprites/candle/candle_wick.png")
  
  api_define_color("WAXYELLOW", {r=149, g=140, b=91})
  api_define_liquid(
    "Candlewax",
    "WAXYELLOW",
    "sprites/wax/cndwaxtexture.png",
    "sprites/wax/cndwaxpreview.png"
  )

  api_define_item({
    id = "cndmold1",
    name = "Wooden Mold",
    category = "Resource",
    tooltip = "A candle-making mold made from wood",
    shop_key = false,
    shop_buy = 10,
    shop_sell = 0,
    durability = 3
    -- singular = true
  }, "sprites/candle/candle_mold1.png")
  
  api_define_item({
    id = "cndmold2",
    name = "Infused Mold",
    category = "Resource",
    tooltip = "A sturdier candle-making mold",
    shop_key = false,
    shop_buy = 10,
    shop_sell = 0,
    durability = 5
    -- singular = true
  }, "sprites/candle/candle_mold2.png")
  
  api_define_item({
    id = "cndmold3",
    name = "Honeycore Mold",
    category = "Resource",
    tooltip = "A strong, long lasting candle mold",
    shop_key = false,
    shop_buy = 100,
    shop_sell = 20,
    durability = 10,
    -- singular = true,
    honeycore = true
  }, "sprites/candle/candle_mold3.png")

  api_define_item({
    id = "cndholder",
    name = "Candle Holder",
    category = "Resource",
    tooltip = "A holder for candles",
    shop_key = false,
    shop_buy = 50,
    shop_sell = 5
  }, "sprites/candle/candle_holder.png")
    
  api_define_recipe("t1", MOD_NAME .. "_cndwick", {
    { item = MOD_NAME .. "_fiber", amount = 10}
  }, 1)
  api_define_recipe("t2", MOD_NAME .. "_cndmold1", {
    { item = "planks1", amount = 5 },
    { item = "sticks1", amount = 2}
  }, 1)
  api_define_recipe("t2", MOD_NAME .. "_cndmold2", {
    { item = "planks2", amount = 5 },
    { item = "sticks2", amount = 2}
  }, 1)
  api_define_recipe("t2", MOD_NAME .. "_cndholder", {
    { item = "log", amount = 1 },
    { item = "honeycomb", amount = 2}
  })
end

-- function build_candle_list()
--   for i = 1, NUM_CANDLES do
--     table.insert(CANDLES_LIGHTABLE, "candles_candle" .. i .. "b")
--     table.insert(CANDLES_LIGHTABLE, "candles_candle" .. i .. "d")
--     table.insert(CANDLES_UNLIGHTABLE, "candles_candle" .. i .. "c")
--   end
-- end

function define_candles()
  define_candle_items()
  define_candles_all()
  -- build_candle_list()
  api_define_workbench("Candles Mod", {
    t1 = "Basic Resources",
    t2 = "Candle Parts",
    t3 = "Candle Making"
  })

end