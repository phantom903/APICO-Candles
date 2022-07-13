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
  }, "sprites/candle_wick001.png")
  api_define_recipe("crafting", "candles_cndwick", {{ item = "candles_fiber", amount = 10}}, 1)
  api_define_workbench("Candles", { 
    t1 = "Candles"
  })
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

function define_candles()
  define_fiber()
  define_wick()
  define_liquid_wax()
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