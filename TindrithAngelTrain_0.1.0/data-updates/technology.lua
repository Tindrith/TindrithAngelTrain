-- update technology prerequisites

if mods["angelsindustries"] then
	data.raw["technology"]["angels-crawler-train"].prerequisites = {
 	"angels-vequipment-1",
    "railway",
    "advanced-electronics",
    "automated-rail-transportation",
    }
end

if mods["angelsaddons-petrotrain"] then
	data.raw["technology"]["angels-petro-train"].prerequisites = {
 	"angels-vequipment-1",
    "railway",
    "advanced-electronics",
    "automated-rail-transportation",
    }
end

if mods["angelsaddons-smeltingtrain"] then
	data.raw["technology"]["angels-smelting-train"].prerequisites = {
 	"angels-vequipment-1",
    "railway",
    "advanced-electronics",
    "automated-rail-transportation",
    }
end