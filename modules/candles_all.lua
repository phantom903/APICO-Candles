function define_candles_all()
	api_define_object({
		id = 'candle1d',
		name = 'Basic Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A basic, undyed candle in a holder',
		shop_sell = 0.1,
		shop_buy = 0.5
	}, 'sprites/candle/candle1d.png')

	api_define_object({
		id = 'candle1c',
		name = 'Basic Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A basic, undyed candle in a holder',
		shop_sell = 0.1,
		shop_buy = 0.5
	}, 'sprites/candle/candle1c.png')

	api_define_item({
		id = 'candle1a',
		name = 'Basic Candle',
		category = 'Resource',
		machines = {'candles_candle_maker'},
		tooltip = 'A basic, undyed candle',
		shop_key = true,
		singular = false,
		shop_sell = 0.1,
		shop_buy = 0.5
	}, 'sprites/candle/candle1a.png')

	api_define_object({
		id = 'candle1b',
		name = 'Basic Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A basic, undyed candle in a holder',
		shop_sell = 0.1,
		shop_buy = 0.5
	}, 'sprites/candle/candle1b.png')

	api_define_object({
		id = 'candle2d',
		name = 'Black Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Hivesbane in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle2d.png')

	api_define_object({
		id = 'candle2c',
		name = 'Black Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Hivesbane in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle2c.png')

	api_define_item({
		id = 'candle2a',
		name = 'Black Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Hivesbane',
		shop_key = true,
		singular = false,
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle2a.png')

	api_define_object({
		id = 'candle2b',
		name = 'Black Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Hivesbane in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle2b.png')

	api_define_object({
		id = 'candle3d',
		name = 'Blue Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Beekeepers Delight in a holder',
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle3d.png')

	api_define_object({
		id = 'candle3c',
		name = 'Blue Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Beekeepers Delight in a holder',
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle3c.png')

	api_define_item({
		id = 'candle3a',
		name = 'Blue Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Beekeepers Delight',
		shop_key = true,
		singular = false,
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle3a.png')

	api_define_object({
		id = 'candle3b',
		name = 'Blue Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Beekeepers Delight in a holder',
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle3b.png')

	api_define_object({
		id = 'candle4d',
		name = 'Brown Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Combristle in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle4d.png')

	api_define_object({
		id = 'candle4c',
		name = 'Brown Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Combristle in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle4c.png')

	api_define_item({
		id = 'candle4a',
		name = 'Brown Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Combristle',
		shop_key = true,
		singular = false,
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle4a.png')

	api_define_object({
		id = 'candle4b',
		name = 'Brown Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Combristle in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle4b.png')

	api_define_object({
		id = 'candle5d',
		name = 'Glowing Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Glowing Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle5d.png')

	api_define_object({
		id = 'candle5c',
		name = 'Glowing Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Glowing Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle5c.png')

	api_define_item({
		id = 'candle5a',
		name = 'Glowing Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Glowing Bees',
		shop_key = true,
		singular = false,
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle5a.png')

	api_define_object({
		id = 'candle5b',
		name = 'Glowing Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Glowing Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle5b.png')

	api_define_object({
		id = 'candle6d',
		name = 'Gold Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Honeydrop in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle6d.png')

	api_define_object({
		id = 'candle6c',
		name = 'Gold Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Honeydrop in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle6c.png')

	api_define_item({
		id = 'candle6a',
		name = 'Gold Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Honeydrop',
		shop_key = true,
		singular = false,
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle6a.png')

	api_define_object({
		id = 'candle6b',
		name = 'Gold Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Honeydrop in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle6b.png')

	api_define_object({
		id = 'candle7d',
		name = 'Green Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Honeybriar in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle7d.png')

	api_define_object({
		id = 'candle7c',
		name = 'Green Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Honeybriar in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle7c.png')

	api_define_item({
		id = 'candle7a',
		name = 'Green Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Honeybriar',
		shop_key = true,
		singular = false,
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle7a.png')

	api_define_object({
		id = 'candle7b',
		name = 'Green Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Honeybriar in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle7b.png')

	api_define_object({
		id = 'candle8d',
		name = 'Hallowed Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Hallowed Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle8d.png')

	api_define_object({
		id = 'candle8c',
		name = 'Hallowed Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Hallowed Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle8c.png')

	api_define_item({
		id = 'candle8a',
		name = 'Hallowed Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Hallowed Bees',
		shop_key = true,
		singular = false,
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle8a.png')

	api_define_object({
		id = 'candle8b',
		name = 'Hallowed Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Hallowed Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle8b.png')

	api_define_object({
		id = 'candle9d',
		name = 'Icy Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Icy Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle9d.png')

	api_define_object({
		id = 'candle9c',
		name = 'Icy Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Icy Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle9c.png')

	api_define_item({
		id = 'candle9a',
		name = 'Icy Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Icy Bees',
		shop_key = true,
		singular = false,
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle9a.png')

	api_define_object({
		id = 'candle9b',
		name = 'Icy Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Icy Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle9b.png')

	api_define_object({
		id = 'candle10d',
		name = 'Orange Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Goldenrod in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle10d.png')

	api_define_object({
		id = 'candle10c',
		name = 'Orange Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Goldenrod in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle10c.png')

	api_define_item({
		id = 'candle10a',
		name = 'Orange Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Goldenrod',
		shop_key = true,
		singular = false,
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle10a.png')

	api_define_object({
		id = 'candle10b',
		name = 'Orange Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Goldenrod in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle10b.png')

	api_define_object({
		id = 'candle11d',
		name = 'Pink Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Beewell in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle11d.png')

	api_define_object({
		id = 'candle11c',
		name = 'Pink Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Beewell in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle11c.png')

	api_define_item({
		id = 'candle11a',
		name = 'Pink Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Beewell',
		shop_key = true,
		singular = false,
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle11a.png')

	api_define_object({
		id = 'candle11b',
		name = 'Pink Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Beewell in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle11b.png')

	api_define_object({
		id = 'candle12d',
		name = 'Purple Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Beesknees in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle12d.png')

	api_define_object({
		id = 'candle12c',
		name = 'Purple Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Beesknees in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle12c.png')

	api_define_item({
		id = 'candle12a',
		name = 'Purple Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Beesknees',
		shop_key = true,
		singular = false,
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle12a.png')

	api_define_object({
		id = 'candle12b',
		name = 'Purple Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Beesknees in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle12b.png')

	api_define_object({
		id = 'candle13d',
		name = 'Red Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Honeyrose in a holder',
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle13d.png')

	api_define_object({
		id = 'candle13c',
		name = 'Red Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Honeyrose in a holder',
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle13c.png')

	api_define_item({
		id = 'candle13a',
		name = 'Red Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Honeyrose',
		shop_key = true,
		singular = false,
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle13a.png')

	api_define_object({
		id = 'candle13b',
		name = 'Red Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Honeyrose in a holder',
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle13b.png')

	api_define_object({
		id = 'candle14d',
		name = 'Shrouded Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Shrouded Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle14d.png')

	api_define_object({
		id = 'candle14c',
		name = 'Shrouded Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Shrouded Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle14c.png')

	api_define_item({
		id = 'candle14a',
		name = 'Shrouded Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Shrouded Bees',
		shop_key = true,
		singular = false,
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle14a.png')

	api_define_object({
		id = 'candle14b',
		name = 'Shrouded Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Shrouded Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle14b.png')

	api_define_object({
		id = 'candle15d',
		name = 'Sparkling Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Sparkling Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle15d.png')

	api_define_object({
		id = 'candle15c',
		name = 'Sparkling Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Sparkling Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle15c.png')

	api_define_item({
		id = 'candle15a',
		name = 'Sparkling Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Sparkling Bees',
		shop_key = true,
		singular = false,
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle15a.png')

	api_define_object({
		id = 'candle15b',
		name = 'Sparkling Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Sparkling Bees in a holder',
		shop_sell = 100,
		shop_buy = 250
	}, 'sprites/candle/candle15b.png')

	api_define_object({
		id = 'candle16d',
		name = 'Turquoise Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Frosteria in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle16d.png')

	api_define_object({
		id = 'candle16c',
		name = 'Turquoise Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Frosteria in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle16c.png')

	api_define_item({
		id = 'candle16a',
		name = 'Turquoise Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Frosteria',
		shop_key = true,
		singular = false,
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle16a.png')

	api_define_object({
		id = 'candle16b',
		name = 'Turquoise Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Frosteria in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle16b.png')

	api_define_object({
		id = 'candle17d',
		name = 'White Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Pondshine in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle17d.png')

	api_define_object({
		id = 'candle17c',
		name = 'White Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Pondshine in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle17c.png')

	api_define_item({
		id = 'candle17a',
		name = 'White Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Pondshine',
		shop_key = true,
		singular = false,
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle17a.png')

	api_define_object({
		id = 'candle17b',
		name = 'White Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Pondshine in a holder',
		shop_sell = 25,
		shop_buy = 50
	}, 'sprites/candle/candle17b.png')

	api_define_object({
		id = 'candle18d',
		name = 'Yellow Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Swarmwort in a holder',
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle18d.png')

	api_define_object({
		id = 'candle18c',
		name = 'Yellow Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Swarmwort in a holder',
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle18c.png')

	api_define_item({
		id = 'candle18a',
		name = 'Yellow Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Swarmwort',
		shop_key = true,
		singular = false,
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle18a.png')

	api_define_object({
		id = 'candle18b',
		name = 'Yellow Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Swarmwort in a holder',
		shop_sell = 10,
		shop_buy = 15
	}, 'sprites/candle/candle18b.png')

	api_define_object({
		id = 'candle19d',
		name = 'Lime Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Hivanium in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle19d.png')

	api_define_object({
		id = 'candle19c',
		name = 'Lime Candle',
		category = 'Resource',
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		has_lighting = true,
		has_shadow = true,
		tooltip = 'A candle infused with Hivanium in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle19c.png')

	api_define_item({
		id = 'candle19a',
		name = 'Lime Candle',
		category = 'Resource',
		tooltip = 'A candle infused with Hivanium',
		shop_key = true,
		singular = false,
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle19a.png')

	api_define_object({
		id = 'candle19b',
		name = 'Lime Candle',
		category = 'Resource',
		machines = {'workbench'},
		durability = 1000,
		tools = { 'hammer1'},
		singular = true,
		shop_key = false,
		tooltip = 'A candle infused with Hivanium in a holder',
		shop_sell = 50,
		shop_buy = 100
	}, 'sprites/candle/candle19b.png')


end