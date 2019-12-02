-- update entity properties"

if mods["angelsindustries"] then
	data.raw["equipment-grid"]["angels-crawler-locomotive"].width=8
	data.raw["equipment-grid"]["angels-crawler-loco-wagon"].width=8
	data.raw["equipment-grid"]["angels-crawler-wagon"].width=8
	data.raw["equipment-grid"]["angels-crawler-bot-wagon"].width=8
	data.raw["equipment-grid"]["angels-crawler-locomotive"].height=2
	data.raw["equipment-grid"]["angels-crawler-loco-wagon"].height=2
	data.raw["equipment-grid"]["angels-crawler-wagon"].height=2
	data.raw["equipment-grid"]["angels-crawler-bot-wagon"].height=4
	data.raw["locomotive"]["crawler-locomotive"].max_health=1200
	data.raw["locomotive"]["crawler-locomotive-wagon"].max_health=1200
	data.raw["cargo-wagon"]["crawler-wagon"].max_health=800
	data.raw["cargo-wagon"]["crawler-bot-wagon"].max_health=800
	data.raw["locomotive"]["crawler-locomotive"].max_speed=1.2
	data.raw["locomotive"]["crawler-locomotive-wagon"].max_speed=1.2
	data.raw["cargo-wagon"]["crawler-wagon"].max_speed=1.5
	data.raw["cargo-wagon"]["crawler-bot-wagon"].max_speed=1.5
	data.raw["cargo-wagon"]["crawler-wagon"].inventory_size=50
	data.raw["cargo-wagon"]["crawler-bot-wagon"].inventory_size=64
end

if mods["angelsaddons-petrotrain"] then
	data.raw["equipment-grid"]["angels-petro-locomotive"].width=8
	data.raw["equipment-grid"]["angels-petro-tank-wagon"].width=8
	data.raw["equipment-grid"]["angels-petro-locomotive"].height=2
	data.raw["equipment-grid"]["angels-petro-tank-wagon"].height=2
	data.raw["locomotive"]["petro-locomotive-1"].max_health=1000
	data.raw["locomotive"]["petro-locomotive-1"].weight=2000
	data.raw["locomotive"]["petro-locomotive-1"].max_power="600kW"
end

if mods["angelsaddons-smeltingtrain"] then
	data.raw["equipment-grid"]["angels-smelting-locomotive"].width=8
	data.raw["equipment-grid"]["angels-smelting-wagon"].width=8
	data.raw["equipment-grid"]["angels-smelting-locomotive"].height=2
	data.raw["equipment-grid"]["angels-smelting-wagon"].height=2
	data.raw["locomotive"]["smelting-locomotive-1"].max_health=1000
	data.raw["locomotive"]["smelting-locomotive-tender"].max_health=1000
	data.raw["cargo-wagon"]["smelting-wagon-1"].max_health=600
	data.raw["locomotive"]["smelting-locomotive-1"].weight=2000
	data.raw["locomotive"]["smelting-locomotive-tender"].weight=2000
	data.raw["locomotive"]["smelting-locomotive-1"].max_power="600kW"
	data.raw["locomotive"]["smelting-locomotive-tender"].max_power="800kW"
	data.raw["locomotive"]["smelting-locomotive-1"].max_speed=1.2
	data.raw["locomotive"]["smelting-locomotive-tender"].max_speed=1.2
	data.raw["cargo-wagon"]["smelting-wagon-1"].inventory_size=40
end