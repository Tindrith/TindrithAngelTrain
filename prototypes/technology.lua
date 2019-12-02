-- create new technologies mk2-mk3

if mods["angelsindustries"] then
	data:extend(
	{
		{
			type = "technology",
			name = "angels-crawler-train-2",
			icon = "__angelsindustries__/graphics/technology/crawler-loco-tech.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "crawler-locomotive-2"
				},
				{
					type = "unlock-recipe",
					recipe = "crawler-locomotive-wagon-2"
				},
				{
					type = "unlock-recipe",
					recipe = "crawler-wagon-2"
				},
				{
					type = "unlock-recipe",
					recipe = "crawler-bot-wagon-2"
				},
			},
			prerequisites =
			{
				"angels-crawler-train",
				"bob-railway-2",
			},
			unit =
			{
				count = 60,
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
				},
				time = 15
			},
			order = "c-a-2",
		},

		{
			type = "technology",
			name = "angels-crawler-train-3",
			icon = "__angelsindustries__/graphics/technology/crawler-loco-tech.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "crawler-locomotive-3"
				},
				{
					type = "unlock-recipe",
					recipe = "crawler-locomotive-wagon-3"
				},
				{
					type = "unlock-recipe",
					recipe = "crawler-wagon-3"
				},
				{
					type = "unlock-recipe",
					recipe = "crawler-bot-wagon-3"
				},
			},
			prerequisites =
			{
				"angels-crawler-train-2",
				"bob-railway-3",
			},
			unit =
			{
				count = 60,
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
				},
				time = 15
			},
			order = "c-a-3",
		}
	}
)
end

if mods["angelsaddons-petrotrain"] then
	data:extend(
	{
		{
			type = "technology",
			name = "angels-petro-train-2",
			icon = "__angelsaddons-petrotrain__/graphics/technology/petro-loco-1-tech.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "petro-locomotive-2"
				},
				{
					type = "unlock-recipe",
					recipe = "petro-tank1-2"
				},
				{
					type = "unlock-recipe",
					recipe = "petro-tank2-2"
				},
			},
			prerequisites =
			{
				"angels-petro-train",
				"bob-railway-2",
			},
			unit =
			{
				count = 60,
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
				},
				time = 15
			},
			order = "c-a-2",
		},

		{
			type = "technology",
			name = "angels-petro-train-3",
			icon = "__angelsaddons-petrotrain__/graphics/technology/petro-loco-1-tech.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "petro-locomotive-3"
				},
				{
					type = "unlock-recipe",
					recipe = "petro-tank1-3"
				},
				{
					type = "unlock-recipe",
					recipe = "petro-tank2-3"
				},
			},
			prerequisites =
			{
				"angels-petro-train-2",
				"bob-railway-3",
			},
			unit =
			{
				count = 60,
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
				},
				time = 15
			},
			order = "c-a-3",
		}
	}
)
end

if mods["angelsaddons-smeltingtrain"] then
	data:extend(
	{
		{
			type = "technology",
			name = "angels-smelting-train-2",
			icon = "__angelsaddons-smeltingtrain__/graphics/technology/smelting-loco-1-tech.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "smelting-locomotive-2"
				},
				{
					type = "unlock-recipe",
					recipe = "smelting-locomotive-tender-2"
				},
				{
					type = "unlock-recipe",
					recipe = "smelting-wagon-2"
				},
			},
			prerequisites =
			{
				"angels-smelting-train",
				"bob-railway-2",
			},
			unit =
			{
				count = 60,
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
				},
				time = 15
			},
			order = "c-a-2",
		},

		{
			type = "technology",
			name = "angels-smelting-train-3",
			icon = "__angelsaddons-smeltingtrain__/graphics/technology/smelting-loco-1-tech.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "smelting-locomotive-3"
				},
				{
					type = "unlock-recipe",
					recipe = "smelting-locomotive-tender-3"
				},
				{
					type = "unlock-recipe",
					recipe = "smelting-wagon-3"
				},
			},
			prerequisites =
			{
				"angels-smelting-train-2",
				"bob-railway-3",
			},
			unit =
			{
				count = 60,
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
				},
				time = 15
			},
			order = "c-a-3",
		}
	}
)
end 

if mods["bobvehicleequipment"] then
data:extend(
	{
		{
			type = "technology",
			name = "bob-bot-train-1",
            icon = "__base__/graphics/technology/railway.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "bob-cargo-bot-wagon-1"
				},
			},
			prerequisites =
			{
                "railway",
                "advanced-electronics",
                "automated-rail-transportation",
			},
			unit =
			{
				count = 60,
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
				},
				time = 15
			},
			order = "c-a-2",
		},

		{
			type = "technology",
			name = "bob-bot-train-2",
            icon = "__base__/graphics/technology/railway.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "bob-cargo-bot-wagon-2"
				},
			},
			prerequisites =
			{
				"bob-railway-2",
			},
			unit =
			{
				count = 60,
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
				},
				time = 15
			},
			order = "c-a-2",
		},

		{
			type = "technology",
			name = "bob-bot-train-3",
            icon = "__base__/graphics/technology/railway.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "bob-cargo-bot-wagon-3"
				},
			},
			prerequisites =
			{
				"bob-railway-3",
			},
			unit =
			{
				count = 60,
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
				},
				time = 15
			},
			order = "c-a-3",
		}
	}
)
end
