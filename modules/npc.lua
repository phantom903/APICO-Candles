function define_phoebee()

  api_define_npc({
    id = 878,
    name = "Phoebee",
    pronouns = "They/Them",
    tooltip = "Oh hey!",
    shop = true,
    walking = true,
    stock = PHOEBEE_STOCK_INIT,
    specials = PHOEBEE_SPECIAL_INIT,
    dialogue = {
      "There might be other places to find fiber.....",
      "What a lovely day in Port APICO!"
    },
    greeting = "Lovely to finally meet you!"
  },"sprites/npc/npc_standing.png",
    "sprites/npc/npc_standing_h.png",
    "sprites/npc/npc_walking.png",
    "sprites/npc/npc_walking_h.png",
    "sprites/npc/npc_head.png",
    "sprites/npc/npc_bust.png",
    "sprites/npc/npc_item.png",
    "sprites/npc/npc_dialogue_menu.png",
    "sprites/npc/npc_shop_menu.png"
  )

end

function change_stock(stock_table, special_table)
  local phoebees = api_get_menu_objects(nil, "npc878")
  if #phoebees > 0 then
    for i = 1, #phoebees,1 do
      local shop = api_gp(phoebees[i]["menu_id"], "shop")
      api_sp(shop, "specials", special_table)
      local shop_slots = api_get_slots(shop)
      for i = 2, 11 do
        api_slot_clear(shop_slots[i]["id"])
      end
      api_slot_set(shop_slots[1]["id"], special_table[i], 0)
      for i = 1, math.min(10, #stock_table) do
        api_slot_set(shop_slots[i+1]["id"], stock_table[i], 0)
      end
    end
  end
end