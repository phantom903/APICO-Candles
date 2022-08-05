function define_quests()
  api_define_gif("gifq1", "sprites/quest/q1_gif.png", 6)
  -- api_define_gif()
  -- api_define_gif()
  -- api_define_gif()

  api_define_quest({
    id = "candles_quest_1",
    title = "Meet Phoebee",
    reqs = {},
    icon = "npc878",
---@diagnostic disable-next-line: assign-type-mismatch
    reward = "beeswax@1",
    unlock = {MOD_NAME .. "_quest_2"},
  },{
    {text = "Welcome to APICO Candle Making!"},
    {text = ""},
    {text = "Time to start making use of all that excess beeswax - make some useful candles, or just sell them for profit!"},
    }, {
    {text = "First thing's first - go find Phoebee and say hi!"},
    {gif = "gifq1", height = 66}
  },
  "npcTrigger")

  api_define_quest({
    id = "candles_quest_2",
    title = "Fiberous Fun",
    reqs = {MOD_NAME .. "_fiber@1"},
    icon = "npc878",
---@diagnostic disable-next-line: assign-type-mismatch
    reward = MOD_NAME .. "_fiber@9",
    unlock = {},
  },{
    {text = "Now you've met Phoebee, have a look at their shop"},
    {text = ""},
    {text = "Eventually they'll sell lots of useful items - for now, just fiber"},
    }, {
    {text = "Grab a fiber, then check back to see what we can make!"},
    {gif = "gifq1", height = 66}
  },
  "npcShopTrigger")
end

function npcTrigger()
  local friend = api_get_menu_objects(nil, "npc878")
  local friendinv = api_use_total("npc878")
  if #friend == 0 and friendinv == 0 then
    local player = api_get_player_position()
    api_create_obj("npc878", player["x"] + 48, player["y"])
    phoebees = api_get_menu_objects(nil, "npc878")
    if #phoebees > 0 then
      for i = 1, #phoebees do
        api_sp(phoebees[i]["menu_id"], "dialogue_notice", true)    
      end
    end
  end 
end

function npcShopTrigger()
  change_stock(PHOEBEE_STOCK_AFTER, PHOEBEE_SPECIAL_AFTER)
end