if mods["angelsindustries"] then
	data:extend(
		{
			{
				type = "recipe",
				name = "crawler-locomotive-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"crawler-locomotive", 1},
					{"advanced-circuit", 5},
					{"invar-alloy", 10},
					{"steel-gear-wheel", 20},
					{"steel-bearing", 16},
				},
				result = "crawler-locomotive-2"
			},
			{
				type = "recipe",
				name = "crawler-locomotive-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"crawler-locomotive-2", 1},
					{"processing-unit", 5},
					{"titanium-plate", 10},
					{"titanium-gear-wheel", 20},
					{"titanium-bearing", 16},
				},
				result = "crawler-locomotive-3"
			},
			{
				type = "recipe",
				name = "crawler-locomotive-wagon-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"crawler-locomotive-wagon", 1},
					{"advanced-circuit", 10},
					{"invar-alloy", 10},
					{"steel-gear-wheel", 30},
					{"steel-bearing", 20},
				},
				result = "crawler-locomotive-wagon-2"
			},
			{
				type = "recipe",
				name = "crawler-locomotive-wagon-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"crawler-locomotive-wagon-2", 1},
					{"processing-unit", 10},
					{"titanium-plate", 10},
					{"titanium-gear-wheel", 30},
					{"titanium-bearing", 20},
				},
				result = "crawler-locomotive-wagon-3"
			},
			{
				type = "recipe",
				name = "crawler-wagon-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"crawler-wagon", 1},
					{"invar-alloy", 20},
					{"steel-gear-wheel", 12},
					{"steel-bearing", 8},
				},
				result = "crawler-wagon-2"
			},
			{
				type = "recipe",
				name = "crawler-wagon-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"crawler-wagon-2", 1},
					{"titanium-plate", 20},
					{"titanium-gear-wheel", 12},
					{"titanium-bearing", 8},
				},
				result = "crawler-wagon-3"
			},
			{
				type = "recipe",
				name = "crawler-bot-wagon-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"crawler-bot-wagon", 1},
					{"advanced-circuit", 20},
					{"invar-alloy", 20},
					{"steel-gear-wheel", 12},
					{"steel-bearing", 8},
				},
				result = "crawler-bot-wagon-2"
			},
			{
				type = "recipe",
				name = "crawler-bot-wagon-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"crawler-bot-wagon-2", 1},
					{"processing-unit", 20},
					{"titanium-plate", 20},
					{"titanium-gear-wheel", 12},
					{"titanium-bearing", 8},
				},
				result = "crawler-bot-wagon-3"
			},
		}
	)
end

if mods["angelsaddons-petrotrain"] then
	data:extend(
		{
			{
				type = "recipe",
				name = "petro-locomotive-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"petro-locomotive-1", 1},
					{"advanced-circuit", 5},
					{"invar-alloy", 10},
					{"steel-gear-wheel", 20},
					{"steel-bearing", 16},
				},
				result = "petro-locomotive-2"
			},
			{
				type = "recipe",
				name = "petro-locomotive-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"petro-locomotive-2", 1},
					{"processing-unit", 5},
					{"titanium-plate", 10},
					{"titanium-gear-wheel", 20},
					{"titanium-bearing", 16},
				},
				result = "petro-locomotive-3"
			},
			{
				type = "recipe",
				name = "petro-tank1-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"petro-tank1", 1},
					{"steel-gear-wheel", 12},
					{"invar-alloy", 16},
					{"storage-tank-2", 1},
					{"steel-bearing", 8},
				},
				result = "petro-tank1-2"
			},
			{
				type = "recipe",
				name = "petro-tank1-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"petro-tank1-2", 1},
					{"titanium-gear-wheel", 12},
					{"titanium-plate", 16},
					{"storage-tank-3", 1},
					{"titanium-bearing", 8},
				},
				result = "petro-tank1-3"
			},
			{
				type = "recipe",
				name = "petro-tank2-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"petro-tank2", 1},
					{"steel-gear-wheel", 12},
					{"invar-alloy", 16},
					{"storage-tank-2", 1},
					{"steel-bearing", 8},
				},
				result = "petro-tank2-2"
			},
			{
				type = "recipe",
				name = "petro-tank2-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"petro-tank2-2", 1},
					{"titanium-gear-wheel", 12},
					{"titanium-plate", 16},
					{"storage-tank-3", 1},
					{"titanium-bearing", 8},
				},
				result = "petro-tank2-3"
			},
		}
	)
end

if mods["angelsaddons-smeltingtrain"] then
	data:extend(
		{
			{
				type = "recipe",
				name = "smelting-locomotive-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"smelting-locomotive-1", 1},
					{"advanced-circuit", 5},
					{"invar-alloy", 10},
					{"steel-gear-wheel", 20},
					{"steel-bearing", 16},
				},
				result = "smelting-locomotive-2"
			},
			{
				type = "recipe",
				name = "smelting-locomotive-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"smelting-locomotive-2", 1},
					{"processing-unit", 5},
					{"titanium-plate", 10},
					{"titanium-gear-wheel", 20},
					{"titanium-bearing", 16},
				},
				result = "smelting-locomotive-3"
			},
			{
				type = "recipe",
				name = "smelting-locomotive-tender-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"smelting-locomotive-tender", 1},
					{"advanced-circuit", 10},
					{"invar-alloy", 10},
					{"steel-gear-wheel", 30},
					{"steel-bearing", 20},
				},
				result = "smelting-locomotive-tender-2"
			},
			{
				type = "recipe",
				name = "smelting-locomotive-tender-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"smelting-locomotive-tender-2", 1},
					{"processing-unit", 10},
					{"titanium-plate", 10},
					{"titanium-gear-wheel", 30},
					{"titanium-bearing", 20},
				},
				result = "smelting-locomotive-tender-3"
			},
			{
				type = "recipe",
				name = "smelting-wagon-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"smelting-wagon-1", 1},
					{"invar-alloy", 20},
					{"steel-gear-wheel", 12},
					{"steel-bearing", 8},
				},
				result = "smelting-wagon-2"
			},
			{
				type = "recipe",
				name = "smelting-wagon-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"smelting-wagon-2", 1},
					{"titanium-plate", 20},
					{"titanium-gear-wheel", 12},
					{"titanium-bearing", 8},
				},
				result = "smelting-wagon-3"
			},
		}
	)
end

if mods["boblogistics"] then
	data:extend(
		{
			{
				type = "recipe",
				name = "bob-cargo-bot-wagon-1",
                energy_required = 10,
				enabled = false,
				ingredients =
				{
					{"iron-gear-wheel", 25},
					{"iron-plate", 30},
					{"steel-plate", 50},
					{"electronic-circuit", 20},
				},
				result = "bob-cargo-bot-wagon-1"
			},
			{
				type = "recipe",
				name = "bob-cargo-bot-wagon-2",
                energy_required = 15,
				enabled = false,
				ingredients =
				{
					{"bob-cargo-bot-wagon-1", 1},
					{"advanced-circuit", 20},
					{"invar-alloy", 20},
					{"steel-gear-wheel", 12},
					{"steel-bearing", 8},
				},
				result = "bob-cargo-bot-wagon-2"
			},
			{
				type = "recipe",
				name = "bob-cargo-bot-wagon-3",
                energy_required = 20,
				enabled = false,
				ingredients =
				{
					{"bob-cargo-bot-wagon-2", 1},
					{"processing-unit", 20},
					{"titanium-plate", 20},
					{"titanium-gear-wheel", 12},
					{"titanium-bearing", 8},
				},
				result = "bob-cargo-bot-wagon-3"
			},
		}
	)
end
