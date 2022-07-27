function define_quests()
    -- api_define_gif()
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
        unlock = {},
    },{
        {text = "Welcome to APICO Candle Making!"},
        {text = ""},
        {text = "Time to start making use of all that excess beeswax - make some useful candles, or just sell them for profit!"},
        -- {gif = "gif1", height = } - maybe just some candles
    }, {
        {text = "First thing's first - go find Phoebee and say hi!"},
        -- {gif = "gif2", height = } - Phoebee walking about
        })

    -- api_define_quest({
    --     id = "cottage_quest_2",
    --     title = "All Dried Up",
    --     reqs = {"cottage_tea_boxtea001@5"},
    --     icon = "cottage_tea_boxtea001",
    --     reward = "cottage_tea_cauldron@1",
    --     unlock = {"cottage_quest_3"},
    --     },{
    --     {text = "Now it's time to start drying those flowers! Grab the Drying Rack from your inventory and place it anywhere you like!"},
    --     {gif = "click_drying", height = 66}
    --     }, {
    --     {text = "Once placed, you can click on it to open the menu. Place flowers in the left 'Input Slot' and you'll see the station start to turn those flowers into tea."},
    --     {gif = "use_drying", height = 66},
    --     {text = "Keep in mind: You need at LEAST 3 flowers.", color = "FONT_BLUE"}
    --     }
    -- )

    -- -- brew tea
    -- api_define_quest({
    --     id = "cottage_quest_3",
    --     title = "Brew me a Favor",
    --     reqs = {"cottage_tea_tea001@5"},
    --     icon = "cottage_tea_tea001",
    --     reward = "cottage_tea_sq_table01@1",
    --     unlock = {"cottage_quest_4"},
    --     },{
    --     {text = "Now it's time to brew some tea! Place down your Cauldron and gather your supplies."},
    --     {gif = "set_caul", height = 66},
    --     {text = "First we're going to need some water, bottles, and teaboxes."},
    --     {gif = "get_stuff", height = 66}
    --     }, {
    --     {text = "Now we can get to brewing! Click on the Cauldron and place all the ingredients in the correct slots. Then the brewing begins."},
    --     {gif = "use_cauld", height = 66},
    --     {text = "Let's brew some Honeyrose tea!"}
    --     }
    -- )

    -- -- fin
    -- api_define_quest({
    --     id = "cottage_quest_4",
    --     title = "Sip sip, Hooray",
    --     reqs = {"cottage_tea_dish01@1"},
    --     icon = "cottage_tea_dish01",
    --     reward = "cottage_tea_stuffie04@1",
    --     unlock = {},
    --     },{
    --     {text = "Now that you have stacks of cash, let's spend it on some swanky furniture!"},
    --     {text = "You can talk to Mushy. She sells drying racks, cauldrons, and different furniture items."},
    --     {gif = "mushy_stock", height = 86},
    --     {text = "You can press the Φ key to refresh her stock.", color = "FONT_BLUE"}
    --     }, {
    --     {text = "Now you can get your decorating on. Once you place a table, you can put any item in the decorating slot to show it off."},
    --     {gif = "table_set", height = 66},
    --     {text = "Other than that, you've finished all my quests! Thank you so much for downloading my mod!"}
    --     }
    -- )
end