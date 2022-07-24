CMOD_DEVMODE = true

-- Prices (set candle prices in candlegen.py and re-run)
DBLBOILERBUY = 150
DBLBOILERSELL = 60
CNDMAKERBUY = 150
CNDMAKERSELL = 60

-- Double Boiler values
DB_PROGRESS_MAX = 8
DB_PROGRESS_INCR = 0.05
DB_SMOKE_USED = 0.05
DB_SMOKE_MAX = 100
DB_SMOKE_INCR = 2
DB_WAX_CAPACITY = 3200
DB_WAX_PER_BEESWAX = 200
DB_HEATER_BOOST = 10

-- Candle Maker values
CM_PROGRESS_MAX = 8 -- Must be multiple of 4!
CM_DOWNARROW_MAX = 2
CM_PROGRESS_INCR = 0.04 --Must be divisible by 4!
CM_DOWNARROW_INCR = 0.02
CM_WAX_CAPACITY = 3200
CM_WAX_PER_CANDLE = 100
CM_COOLER_BOOST = 12

PHOEBEE_STOCK = {"candles_cndwick", "candles_candle1a", "candles_fiber", "candles_double_boiler", "sawdust2"}
PHOEBEE_SPECIAL = {"log", "log", "log"}

CANDLES_LIGHTABLE = {}
CANDLES_UNLIGHTABLE = {}
NUM_CANDLES = 19