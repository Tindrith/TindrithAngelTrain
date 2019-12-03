data.raw["recipe"]["locomotive"].ingredients = {
		{"engine-unit", 20},
		{"steel-plate", 75},
		{"electronic-circuit", 20},
		{"iron-gear-wheel", 25},
	}

data.raw["recipe"]["locomotive"]["energy_required"] = 10

data.raw["recipe"]["fluid-wagon"].ingredients = {
		{"storage-tank", 3},
		{"steel-plate", 50},
		{"iron-plate", 30},
		{"pipe", 25},
	}

data.raw["recipe"]["fluid-wagon"]["energy_required"] = 10

data.raw["recipe"]["cargo-wagon"].ingredients = {
		{"steel-plate", 50},
		{"iron-plate", 30},
		{"iron-gear-wheel", 25},
	}

data.raw["recipe"]["cargo-wagon"]["energy_required"] = 10

if mods["angelsindustries"] then
	data.raw["recipe"]["crawler-locomotive-wagon"].ingredients = {
		{"engine-unit", 25},
		{"steel-plate", 75},
		{"electronic-circuit", 20},
		{"iron-gear-wheel", 25},
	}
	data.raw["recipe"]["crawler-wagon"].ingredients = {
		{"steel-plate", 75},
		{"iron-plate", 50},
		{"iron-gear-wheel", 25},
	}
end

if mods["angelsaddons-petrotrain"] then
   
end

if mods["angelsaddons-smeltingtrain"] then
data.raw["recipe"]["smelting-locomotive-tender"].ingredients = {
		{"engine-unit", 25},
		{"steel-plate", 75},
		{"electronic-circuit", 20},
		{"iron-gear-wheel", 25},
	}

data.raw["recipe"]["smelting-wagon-1"].ingredients = {
		{"steel-plate", 50},
		{"iron-plate", 30},
		{"iron-gear-wheel", 25},
	}
end

if mods["boblogistics"] then
data.raw["recipe"]["bob-locomotive-2"]["energy_required"] = 15
data.raw["recipe"]["bob-locomotive-3"]["energy_required"] = 20
data.raw["recipe"]["bob-armoured-locomotive"]["energy_required"] = 15
data.raw["recipe"]["bob-armoured-locomotive-2"]["energy_required"] = 20
data.raw["recipe"]["bob-cargo-wagon-2"]["energy_required"] = 15
data.raw["recipe"]["bob-cargo-wagon-3"]["energy_required"] = 20
data.raw["recipe"]["bob-fluid-wagon-2"]["energy_required"] = 15
data.raw["recipe"]["bob-fluid-wagon-3"]["energy_required"] = 20
data.raw["recipe"]["bob-armoured-cargo-wagon"]["energy_required"] = 15
data.raw["recipe"]["bob-armoured-cargo-wagon-2"]["energy_required"] = 20
data.raw["recipe"]["bob-armoured-fluid-wagon"]["energy_required"] = 15
data.raw["recipe"]["bob-armoured-fluid-wagon-2"]["energy_required"] = 20
end
