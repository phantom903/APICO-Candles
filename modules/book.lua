CB_CURSOR_SPR = -1
CB_SLOT_SPR = -1
TEXTBOX_SIZE = 122
CB_MENU = -1

function create_recipe_book()
  api_create_obj(MOD_NAME .. "_book", 0, 0)
  api_library_add_book("candles_book", "open_candle_book", "sprites/unverified/book_button.png")
end

function open_candles_book()
  api_toggle_menu(CB_MENU, 'open')
end

function prep_recipe_book()
  CB_CURSOR_SPR = api_define_sprite("cb_cursor", "sprites/unverified/recipe_book_cursor.png", 2)
  CB_SLOT_SPR = api_define_sprite("cb_slot", "sprites/unverified/rb_slot.png", 2)
  CB_CRAFT_ARROW = api_define_sprite("cb_craft_arrow", "sprites/unverified/rb_craft_arrow.png", 1)
  CB_ITEM_UNDERLINE = api_define_sprite("cb_item_underline", "sprites/unverCfied/rb_item_underline.png", 1)
end

function define_recipe_book()
  api_define_menu_object({
    id = "candles_book",
    name = "Candles Book",
    category = "Books",
    tooltip = "All the candles!",
    shop_key = false,
    shop_buy = 0,
    shop_sell = 0,
    center = true,
    layout = {},
    buttons = {"Close", "Move"},
    info = {},
    tools = {"mouse1", "hammer1"},
    placeable = true,
    invisible = true
}, "sprites/unverified/recipe_book.png", "sprites/unverified/book_menu.png", {
    define = "candbook_define",
    draw = "candbook_draw"
  })
  prep_recipe_book()
end

function candbook_define(menu_id)
  CB_MENU = menu_id
end

function candbook_draw(menu_id)
  
end