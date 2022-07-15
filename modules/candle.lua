function define_fiber()
  api_define_item({
    id = "fiber",
    name = "Fiber",
    category = "Resource",
    tooltip = "Strands of fiber found in a shrub, I wonder if they can be used for anything?",
    shop_key = false,
    shop_buy = 10,
    shop_sell = 0
  }, "sprites/plant_fiber001.png")
end

function define_wick()
  api_define_item({
    id = "cndwick",
    name = "Candle Wick",
    category = "Resource",
    tooltip = "A Candle wick made from fibers",
    shop_key = false,
    shop_buy = 10,
    shop_sell = 0
  }, "sprites/candle/candle_wick001.png")
  api_define_recipe("t1", MOD_NAME .. "_cndwick", {{ item = MOD_NAME .. "_fiber", amount = 10}}, 1)
end

function define_liquid_wax()
  api_define_color("WAXYELLOW", {r=149, g=140, b=91})
  api_define_liquid(
    "Candlewax",
    "WAXYELLOW",
    "sprites/cndwaxtexture.png",
    "sprites/cndwaxpreview.png"
  )
end

function define_molds()
  api_define_item({
    id = "cndmold1",
    name = "Wooden Mold",
    category = "Resource",
    tooltip = "A candle-making mold made from wood",
    shop_key = false,
    shop_buy = 10,
    shop_sell = 0,
    durability = 3
  }, "sprites/candle/candle_mold1.png")
  api_define_recipe("t2", MOD_NAME .. "_cndmold1", {{ item = "planks1", amount = 5}, { item = "sticks1", amount = 2}}, 1)

  api_define_item({
    id = "cndmold2",
    name = "Infused Mold",
    category = "Resource",
    tooltip = "A sturdier candle-making mold",
    shop_key = false,
    shop_buy = 10,
    shop_sell = 0,
    durability = 5
  }, "sprites/candle/candle_mold2.png")
  api_define_recipe("t2", MOD_NAME .. "_cndmold2", {{ item = "planks2", amount = 5}, { item = "sticks2", amount = 2}}, 1)

end

function define_candles()
  define_fiber()
  define_wick()
  define_molds()
  define_liquid_wax()
  api_define_workbench("Candles Mod", {
    t1 = "Basic Resources",
    t2 = "Candle Making"
  })

  api_define_item({
    id = "cndunlit1",
    name = "Basic Unlit Candle",
    category = "Resource",
    tooltip = "This is a candle!",
    durability = 1000,
    shop_key = false,
    shop_buy = 50,
    shop_sell = 20
  }, "sprites/candle/candle_dyed_black_1.png")

end