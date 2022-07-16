import json

# Settings --------->
prices = {0 : { "sell": 0.10, "buy": 0.50 }, 1 : { "sell": 10, "buy": 15 }, 2 : { "sell": 25, "buy": 50 }, 3 : { "sell": 50, "buy": 100 }, 4 : { "sell": 100, "buy": 250 }}
defsfile = open("batchcandles.json")
defs = json.load(defsfile)
category = "Resource"

variants = { 'a', 'b', 'c', 'd' }

output = ['function define_candles_all()\n']

for i in defs.keys():
  for variant in variants:
    outline = "\tapi_define_item({\n\t\tid = \'candle"
    outline += i + variant + "\',\n"
    outline += "\t\tname = \'" + defs[i]['name'] + "\',\n"
    outline += "\t\tcategory = \'" + category + "\',\n"
    outline += "\t\ttooltip = \'" + defs[i]['tooltip'] + "\',\n"
    if variant != 'a':
      outline += "\t\tdurability = 1000,\n"
      outline += "\t\tplaceable = true,\n"
      outline += "\t\tsingular = true,\n"
      outline += "\t\tshop_key = false,\n"
    else:
      outline += "\t\tmachines = {\'workbench\'},\n"
      outline += "\t\tshop_key = true,\n"
      outline += "\t\tsingular = false,\n"
    outline += "\t\tshop_sell = " + str(prices[defs[i]['tier']]['sell']) + ",\n"
    outline += "\t\tshop_buy = " + str(prices[defs[i]['tier']]['buy']) + "\n"
    outline += "\t}, \'sprites/candle/candle" + i + variant + ".png\')\n\n"
    output.append(outline)
output.append("\nend")

outfile = open("modules/candles_all.lua", "w")
outfile.writelines(output)