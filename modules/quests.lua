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
    {text = "Time to start making use of all that beeswax - make some useful candles, or just sell them for profit!"},
    }, {
    {text = "First thing\'s first - go find Phoebee and say hi!"},
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
    unlock = {"candles_quest_3"},
  },{
    {text = "Now you\'ve met Phoebee, have a look at their shop"},
    {text = ""},
    {text = "Eventually they\'ll sell lots of useful items - for now, just fiber"},
    }, {
    {text = "Grab a fiber, then check back to see what we can make!"},
    {text = "Of course, there may be other places to find fibers - but let\'s not beat around the bush (or shrub, for that matter....)"},
    {gif = "gifq1", height = 66}
  },
  "npcShopTrigger")

  api_define_quest({
    id = "candles_quest_3",
    title = "Can I get a wick?",
    reqs = {MOD_NAME .. "_cndwick@1", "workbench2@1"},
    icon = "npc878",
---@diagnostic disable-next-line: assign-type-mismatch
    reward = MOD_NAME .. "_fiber@10",
    unlock = {"candles_quest_4"},
  },{
    {text = "Now you have enough fibers to make a candle wick - but you\'ll need a new table to craft it"},
    {text = ""},
    {text = "Craft a Mod Workbench, and use it to make a candle wick"},
    }, {
    {text = "The Mod Workbench has many uses, so keep it to hand!"},
    {gif = "gifq1", height = 66}
  })

  api_define_quest({
    id = "candles_quest_4",
    title = "None of your beeswax",
    reqs = {"beeswax@20", "canister1@2"},
    icon = "npc878",
---@diagnostic disable-next-line: assign-type-mismatch
    reward = MOD_NAME .. "_double_boiler",
    unlock = {"candles_quest_5"},
  },{
    {text = "We\'ll be making candles from beeswax, so you\'d better start gathering some"},
    {text = ""},
    {text = "Beeswax can be gathered in the usual way, by filling and processing frames in an apiary"},
    }, {
    {text = "You should probably grab some canisters too, to fill with freshly melted wax!"},
    {gif = "gifq1", height = 66}
  })

  api_define_quest({
    id = "candles_quest_5",
    title = "",
    reqs = {},
    icon = "npc878",
---@diagnostic disable-next-line: assign-type-mismatch
    reward = MOD_NAME .. "",
    unlock = {"candles_quest_6"},
  },{
    {text = ""},
    {text = ""},
    {text = ""},
    }, {
    {text = ""},
    {gif = "gifq1", height = 66}
  })
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