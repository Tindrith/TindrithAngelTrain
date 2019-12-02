local fluidwagonbase = settings.startup["bobmods-logistics-fluidwagonbase"].value * 1000
data.raw["fluid-wagon"]["fluid-wagon"].capacity = fluidwagonbase

-- create new entities mk2-mk3
if mods["angelsindustries"] then
	data:extend(
		{
        -- Mk2
			{
				type = "equipment-grid",
				name = "angels-crawler-locomotive-2",
				width = 8,
				height = 3,
				equipment_categories = {"angels-energy", "angels-heavy-defense", "angels-movement", "train", "locomotive"}
			},
			{
				type = "equipment-grid",
				name = "angels-crawler-loco-wagon-2",
				width = 8,
				height = 3,
				equipment_categories = {"angels-energy", "angels-heavy-defense", "angels-movement", "train", "locomotive"}
			},
			{
				type = "equipment-grid",
				name = "angels-crawler-wagon-2",
				width = 8,
				height = 3,
				equipment_categories = {"angels-energy", "angels-repair", "angels-heavy-defense", "angels-movement", "train", "cargo-wagon"}
			},
			{
				type = "equipment-grid",
				name = "angels-crawler-bot-wagon-2",
				width = 10,
				height = 6,
				equipment_categories = {"angels-energy", "angels-repair", "angels-heavy-defense", "angels-construction", "angels-movement", "train", "cargo-wagon", "bot-wagon"}
			},
			{
				type = "item-with-entity-data",
				name = "crawler-locomotive-2",
				icon = "__angelsindustries__/graphics/icons/crawler-loco-ico.png",
				icon_size = 32,
				subgroup = "angels-crawler-train",
				order = "a[crawler-locomotive]",
				place_result = "crawler-locomotive-2",
				stack_size = 5
			},
			{
				type = "locomotive",
				name = "crawler-locomotive-2",
				icon = "__angelsindustries__/graphics/icons/crawler-loco-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "crawler-locomotive-2"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1350,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
				selection_box = {{-1, -3}, {1, 3}},
				drawing_box = {{-1, -4}, {1, 3}},
				weight = 3000,
				max_speed = 1.7,
				max_power = "900kW",
				reversing_power_modifier = 0.6,
				braking_force = 15,
				friction_force = 0.375,
				vertical_selection_shift = -0.5,
				air_resistance = 0.005625, -- this is a percentage of current speed that will be subtracted
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-crawler-locomotive-2",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    }
                },
				burner =
				{
					fuel_category = "chemical",
					effectivity = 1.2,
					fuel_inventory_size = 4,
					smoke =
					{
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0, 3},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						}
					}
				},
				front_light =
				{
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {-0.6, -16},
						size = 2,
						intensity = 0.6
					},
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {0.6, -16},
						size = 2,
						intensity = 0.6
					}
				},
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
				pictures =
				{
					priority = "very-low",
					width = 256,
					height = 256,
					direction_count = 128,
					filenames =
					{
						"__angelsindustries__/graphics/entity/crawler-train/crawler-loco-1.png",
						"__angelsindustries__/graphics/entity/crawler-train/crawler-loco-2.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0.0, -0.75}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				stop_trigger =
				{
					-- left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, -2.7}, {-0.3, -1}}
					},
					-- right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, -2.7}, {0.75, -1}}
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/train-breaks.ogg",
								volume = 0.6
							},
						}
					},
				},
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-engine.ogg",
						volume = 0.4
					},
					match_speed_to_activity = true,
				},
				open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
				close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
				sound_minimum_speed = 0.5;
			},
			
			{
				type = "item-with-entity-data",
				name = "crawler-locomotive-wagon-2",
				icon = "__angelsindustries__/graphics/icons/crawler-loco-wagon-ico.png",
				icon_size = 32,
				subgroup = "angels-crawler-train",
				order = "b[crawler-locomotive-wagon]",
				place_result = "crawler-locomotive-wagon-2",
				stack_size = 5
			},
			{
				type = "locomotive",
				name = "crawler-locomotive-wagon-2",
				icon = "__angelsindustries__/graphics/icons/crawler-loco-wagon-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "crawler-locomotive-wagon-2"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1350,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
				selection_box = {{-1, -3}, {1, 3}},
				drawing_box = {{-1, -4}, {1, 3}},
				weight = 3000,
				max_speed = 1.7,
				max_power = "1100kW",
				reversing_power_modifier = 0.6,
				braking_force = 20,
				friction_force = 0.375,
				vertical_selection_shift = -0.5,
				air_resistance = 0.005625, -- this is a percentage of current speed that will be subtracted
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-crawler-loco-wagon-2",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				burner =
				{
					fuel_category = "chemical",
					effectivity = 1.2,
					fuel_inventory_size = 4,
					smoke =
					{
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0, 3},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0, -3},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						}
					}
				},
				front_light =
				{
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {-0.6, -16},
						size = 2,
						intensity = 0.6
					},
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {0.6, -16},
						size = 2,
						intensity = 0.6
					}
				},
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
				pictures =
				{
					priority = "very-low",
					width = 256,
					height = 256,
					direction_count = 128,
					filenames =
					{
							"__angelsindustries__/graphics/entity/crawler-train/crawler-loco-wagon-1.png",
							"__angelsindustries__/graphics/entity/crawler-train/crawler-loco-wagon-2.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0.0, -0.75}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				stop_trigger =
				{
					-- front left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, -2.7}, {-0.3, -1}}
					},
					-- front right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, -2.7}, {0.75, -1}}
					},
					-- rear left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, 2.7}, {-0.3, 1}}
					},
					-- rear right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, 2.7}, {0.75, 1}}
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/train-breaks.ogg",
								volume = 0.6
							},
						}
					},
				},
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-engine.ogg",
						volume = 0.4
					},
					match_speed_to_activity = true,
				},
				open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
				close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
				sound_minimum_speed = 0.5;
			},
			
			{
				type = "item-with-entity-data",
				name = "crawler-wagon-2",
				icon = "__angelsindustries__/graphics/icons/crawler-wagon-ico.png",
				icon_size = 32,
				subgroup = "angels-crawler-train",
				order = "c[crawler-wagon]",
				place_result = "crawler-wagon-2",
				stack_size = 5
			},
			{
				type = "cargo-wagon",
				name = "crawler-wagon-2",
				icon = "__angelsindustries__/graphics/icons/crawler-wagon-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				inventory_size = 75,
				minable = {mining_time = 1, result = "crawler-wagon-2"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1000,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
				selection_box = {{-1, -2.703125}, {1, 3.296875}},
				vertical_selection_shift = -0.796875,
				weight = 1750,
				max_speed = 2.5,
				braking_force = 4,
				friction_force = 0.375,
				air_resistance = 0.0075,
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-crawler-wagon-2",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
				pictures =
				{
					priority = "very-low",
					width = 256,
					height = 256,
					--back_equals_front = true,
					direction_count = 64,
					filenames =
					{
						"__angelsindustries__/graphics/entity/crawler-train/crawler-wagon.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0, -0.75}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-wheels.ogg",
						volume = 0.6
					},
					match_volume_to_activity = true,
				},
				crash_trigger = crash_trigger(),
				open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
				close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
				sound_minimum_speed = 0.5;
				vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
			},
			
			{
				type = "item-with-entity-data",
				name = "crawler-bot-wagon-2",
				icon = "__angelsindustries__/graphics/icons/crawler-bot-wagon-ico.png",
				icon_size = 32,
				subgroup = "angels-crawler-train",
				order = "d[crawler-bot-wagon]",
				place_result = "crawler-bot-wagon-2",
				stack_size = 5
			},
			{
				type = "cargo-wagon",
				name = "crawler-bot-wagon-2",
				icon = "__angelsindustries__/graphics/icons/crawler-bot-wagon-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				inventory_size = 96,
				minable = {mining_time = 1, result = "crawler-bot-wagon-2"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1000,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
				selection_box = {{-1, -2.703125}, {1, 3.296875}},
				vertical_selection_shift = -0.796875,
				weight = 2000,
				max_speed = 2.5,
				braking_force = 4,
				friction_force = 0.50,
				air_resistance = 0.0075,
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-crawler-bot-wagon-2",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
				pictures =
				{
					priority = "very-low",
					width = 256,
					height = 256,
					--back_equals_front = true,
					direction_count = 64,
					filenames =
					{
							"__angelsindustries__/graphics/entity/crawler-train/crawler-bot-wagon.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0, -0.75}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-wheels.ogg",
						volume = 0.6
					},
					match_volume_to_activity = true,
				},
				crash_trigger = crash_trigger(),
				open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
				close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
				sound_minimum_speed = 0.5;
				vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
			},
		
		-- Mk3
			{
				type = "equipment-grid",
				name = "angels-crawler-locomotive-3",
				width = 8,
				height = 4,
				equipment_categories = {"angels-energy", "angels-heavy-defense", "angels-movement", "train", "locomotive"}
			},
			{
				type = "equipment-grid",
				name = "angels-crawler-loco-wagon-3",
				width = 8,
				height = 4,
				equipment_categories = {"angels-energy", "angels-heavy-defense", "angels-movement", "train", "locomotive"}
			},
			{
				type = "equipment-grid",
				name = "angels-crawler-wagon-3",
				width = 8,
				height = 4,
				equipment_categories = {"angels-energy", "angels-repair", "angels-heavy-defense", "angels-movement", "train", "cargo-wagon"}
			},
			{
				type = "equipment-grid",
				name = "angels-crawler-bot-wagon-3",
				width = 11,
				height = 7,
				equipment_categories = {"angels-energy", "angels-repair", "angels-heavy-defense", "angels-construction", "angels-movement", "train", "cargo-wagon", "bot-wagon"}
			},
			{
				type = "item-with-entity-data",
				name = "crawler-locomotive-3",
				icon = "__angelsindustries__/graphics/icons/crawler-loco-ico.png",
				icon_size = 32,
				subgroup = "angels-crawler-train",
				order = "a[crawler-locomotive]",
				place_result = "crawler-locomotive-3",
				stack_size = 5
			},
			{
				type = "locomotive",
				name = "crawler-locomotive-3",
				icon = "__angelsindustries__/graphics/icons/crawler-loco-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "crawler-locomotive-3"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1700,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
				selection_box = {{-1, -3}, {1, 3}},
				drawing_box = {{-1, -4}, {1, 3}},
				weight = 3000,
				max_speed = 2,
				max_power = "1200kW",
				reversing_power_modifier = 1,
				braking_force = 20,
				friction_force = 0.25,
				vertical_selection_shift = -0.5,
				air_resistance = 0.004, -- this is a percentage of current speed that will be subtracted
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-crawler-locomotive-3",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				burner =
				{
					fuel_category = "chemical",
					effectivity = 1.4,
					fuel_inventory_size = 5,
					smoke =
					{
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0, 3},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						}
					}
				},
				front_light =
				{
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {-0.6, -16},
						size = 2,
						intensity = 0.6
					},
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {0.6, -16},
						size = 2,
						intensity = 0.6
					}
				},
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
				pictures =
				{
					priority = "very-low",
					width = 256,
					height = 256,
					direction_count = 128,
					filenames =
					{
						"__angelsindustries__/graphics/entity/crawler-train/crawler-loco-1.png",
						"__angelsindustries__/graphics/entity/crawler-train/crawler-loco-2.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0.0, -0.75}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				stop_trigger =
				{
					-- left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, -2.7}, {-0.3, -1}}
					},
					-- right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, -2.7}, {0.75, -1}}
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/train-breaks.ogg",
								volume = 0.6
							},
						}
					},
				},
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-engine.ogg",
						volume = 0.4
					},
					match_speed_to_activity = true,
				},
				open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
				close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
				sound_minimum_speed = 0.5;
			},
			
			{
				type = "item-with-entity-data",
				name = "crawler-locomotive-wagon-3",
				icon = "__angelsindustries__/graphics/icons/crawler-loco-wagon-ico.png",
				icon_size = 32,
				subgroup = "angels-crawler-train",
				order = "b[crawler-locomotive-wagon]",
				place_result = "crawler-locomotive-wagon-3",
				stack_size = 5
			},
			{
				type = "locomotive",
				name = "crawler-locomotive-wagon-3",
				icon = "__angelsindustries__/graphics/icons/crawler-loco-wagon-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "crawler-locomotive-wagon-3"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1700,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
				selection_box = {{-1, -3}, {1, 3}},
				drawing_box = {{-1, -4}, {1, 3}},
				weight = 3000,
				max_speed = 2,
				max_power = "1400kW",
				reversing_power_modifier = 1,
				braking_force = 25,
				friction_force = 0.25,
				vertical_selection_shift = -0.5,
				air_resistance = 0.004, -- this is a percentage of current speed that will be subtracted
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-crawler-loco-wagon-3",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				burner =
				{
					fuel_category = "chemical",
					effectivity = 1.4,
					fuel_inventory_size = 5,
					smoke =
					{
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0, 3},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0, -3},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						}
					}
				},
				front_light =
				{
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {-0.6, -16},
						size = 2,
						intensity = 0.6
					},
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {0.6, -16},
						size = 2,
						intensity = 0.6
					}
				},
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
				pictures =
				{
					priority = "very-low",
					width = 256,
					height = 256,
					direction_count = 128,
					filenames =
					{
							"__angelsindustries__/graphics/entity/crawler-train/crawler-loco-wagon-1.png",
							"__angelsindustries__/graphics/entity/crawler-train/crawler-loco-wagon-2.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0.0, -0.75}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				stop_trigger =
				{
					-- front left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, -2.7}, {-0.3, -1}}
					},
					-- front right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, -2.7}, {0.75, -1}}
					},
					-- rear left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, 2.7}, {-0.3, 1}}
					},
					-- rear right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, 2.7}, {0.75, 1}}
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/train-breaks.ogg",
								volume = 0.6
							},
						}
					},
				},
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-engine.ogg",
						volume = 0.4
					},
					match_speed_to_activity = true,
				},
				open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
				close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
				sound_minimum_speed = 0.5;
			},
			
			{
				type = "item-with-entity-data",
				name = "crawler-wagon-3",
				icon = "__angelsindustries__/graphics/icons/crawler-wagon-ico.png",
				icon_size = 32,
				subgroup = "angels-crawler-train",
				order = "c[crawler-wagon]",
				place_result = "crawler-wagon-3",
				stack_size = 5
			},
			{
				type = "cargo-wagon",
				name = "crawler-wagon-3",
				icon = "__angelsindustries__/graphics/icons/crawler-wagon-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				inventory_size = 75,
				minable = {mining_time = 1, result = "crawler-wagon-3"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1200,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
				selection_box = {{-1, -2.703125}, {1, 3.296875}},
				vertical_selection_shift = -0.796875,
				weight = 2500,
				max_speed = 3.5,
				braking_force = 5,
				friction_force = 0.25,
				air_resistance = 0.005,
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-crawler-wagon-3",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
				pictures =
				{
					priority = "very-low",
					width = 256,
					height = 256,
					--back_equals_front = true,
					direction_count = 64,
					filenames =
					{
						"__angelsindustries__/graphics/entity/crawler-train/crawler-wagon.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0, -0.75}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-wheels.ogg",
						volume = 0.6
					},
					match_volume_to_activity = true,
				},
				crash_trigger = crash_trigger(),
				open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
				close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
				sound_minimum_speed = 0.5;
				vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
			},
			
			{
				type = "item-with-entity-data",
				name = "crawler-bot-wagon-3",
				icon = "__angelsindustries__/graphics/icons/crawler-bot-wagon-ico.png",
				icon_size = 32,
				subgroup = "angels-crawler-train",
				order = "d[crawler-bot-wagon]",
				place_result = "crawler-bot-wagon-3",
				stack_size = 5
			},
			{
				type = "cargo-wagon",
				name = "crawler-bot-wagon-3",
				icon = "__angelsindustries__/graphics/icons/crawler-bot-wagon-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				inventory_size = 128,
				minable = {mining_time = 1, result = "crawler-bot-wagon-3"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1200,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
				selection_box = {{-1, -2.703125}, {1, 3.296875}},
				vertical_selection_shift = -0.796875,
				weight = 3000,
				max_speed = 3.5,
				braking_force = 5,
				friction_force = 0.25,
				air_resistance = 0.005,
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-crawler-bot-wagon-3",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
				pictures =
				{
					priority = "very-low",
					width = 256,
					height = 256,
					--back_equals_front = true,
					direction_count = 64,
					filenames =
					{
							"__angelsindustries__/graphics/entity/crawler-train/crawler-bot-wagon.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0, -0.75}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-wheels.ogg",
						volume = 0.6
					},
					match_volume_to_activity = true,
				},
				crash_trigger = crash_trigger(),
				open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
				close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
				sound_minimum_speed = 0.5;
				vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
			},
		}
	)
end

if mods["angelsaddons-petrotrain"] then
	data:extend(
		{
		-- Mk2
			{
				type = "equipment-grid",
				name = "angels-petro-locomotive-2",
				width = 8,
				height = 3,
				equipment_categories = {"angels-energy", "angels-heavy-defense", "angels-movement", "train", "locomotive"}
			},
			{
				type = "equipment-grid",
				name = "angels-petro-tank-wagon-2",
				width = 8,
				height = 3,
				equipment_categories = {"angels-energy", "angels-repair", "angels-heavy-defense", "angels-movement", "train", "cargo-wagon"}
			},
			{
				type = "item-with-entity-data",
				name = "petro-locomotive-2",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-loco-1-ico.png",
				icon_size = 32,
				subgroup = "angels-petrotrain",
				order = "a",
				place_result = "petro-locomotive-2",
				stack_size = 5
			},
			{
				type = "locomotive",
				name = "petro-locomotive-2",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-loco-1-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "petro-locomotive-2"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1350,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
				selection_box = {{-1, -3}, {1, 3}},
				drawing_box = {{-1, -4}, {1, 3}},
				weight = 2000,
				max_speed = 1.7,
				max_power = "900kW",
				reversing_power_modifier = 0.8,
				braking_force = 15,
				friction_force = 0.375,
				vertical_selection_shift = -0.5,
				air_resistance = 0.005625, -- this is a percentage of current speed that will be subtracted
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-petro-locomotive-2",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				burner =
				{
					fuel_category = "chemical",
					effectivity = 1.2,
					fuel_inventory_size = 4,
					smoke =
					{
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0, 3},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						}
					}
				},
				front_light =
				{
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {-0.6, -16},
						size = 2,
						intensity = 0.6
					},
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {0.6, -16},
						size = 2,
						intensity = 0.6
					}
				},
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
				pictures =
				{
					priority = "very-low",
					width = 256,
					height = 256,
					direction_count = 128,
					filenames =
					{
						"__angelsaddons-petrotrain__/graphics/entity/petro-loco1/petro-loco1-1.png",
						"__angelsaddons-petrotrain__/graphics/entity/petro-loco1/petro-loco1-2.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0.0, -0.75}
				},
				{
					priority = "very-low",
					flags = { "compressed" },
					width = 256,
					height = 256,
					direction_count = 128,
					draw_as_shadow = true,
					filenames =
					{
						"__angelsaddons-petrotrain__/graphics/entity/petro-loco1/petro-loco1-shadow-1.png",
						"__angelsaddons-petrotrain__/graphics/entity/petro-loco1/petro-loco1-shadow-2.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0.5, -0.5}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				stop_trigger =
				{
					-- left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, -2.7}, {-0.3, -1}}
					},
					-- right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, -2.7}, {0.75, -1}}
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/train-breaks.ogg",
								volume = 0.6
							},
						}
					},
				},
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-engine.ogg",
						volume = 0.4
					},
					match_speed_to_activity = true,
				},
				open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
				close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
				sound_minimum_speed = 0.5;
			},
			
			{
				type = "item-with-entity-data",
				name = "petro-tank1-2",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-tank1-ico.png",
				icon_size = 32,
				subgroup = "angels-petrotrain",
				order = "b",
				place_result = "petro-tank1-2",
				stack_size = 5
			},
			{
				type = "fluid-wagon",
				name = "petro-tank1-2",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-tank1-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "petro-tank1-2"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 800,
				capacity = fluidwagonbase*1.5,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
				selection_box = {{-1, -2.703125}, {1, 3.296875}},
				gui_front_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/front-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_center_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/center-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_back_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/back-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_connect_front_center_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/connector-front-center.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_connect_center_back_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/connector-center-back.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_front_center_tank_indiciation =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/1.png",
					width = 32,
					height = 32,
					flags = {"icon"}
				},
				gui_center_back_tank_indiciation =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/2.png",
					width = 32,
					height = 32,
					flags = {"icon"}
				},
				vertical_selection_shift = -0.796875,
				weight = 1500,
				max_speed = 2.5,
				braking_force = 4,
				friction_force = 0.375,
				air_resistance = 0.0075,
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 6,
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
				pictures =
				{
					layers =
					{
						{
							priority = "very-low",
							width = 256,
							height = 256,
							direction_count = 64,
							filenames =
							{
								"__angelsaddons-petrotrain__/graphics/entity/petro-tank1/petro-tank1.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0, -0.75}
						},
						{
							flags = { "compressed" },
							width = 256,
							height = 256,
							draw_as_shadow = true,
							direction_count = 64,
							filenames =
							{
								"__angelsaddons-petrotrain__/graphics/entity/petro-tank1/petro-tank1-shadow.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.5, -0.5}
						},
					},
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-wheels.ogg",
						volume = 0.6
					},
					match_volume_to_activity = true,
				},
				crash_trigger = crash_trigger(),
				sound_minimum_speed = 0.5;
				vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
				equipment_grid = "angels-petro-tank-wagon-2",
			},
			{
				type = "item-with-entity-data",
				name = "petro-tank2-2",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-tank2-ico.png",
				icon_size = 32,
				subgroup = "angels-petrotrain",
				order = "c",
				place_result = "petro-tank2-2",
				stack_size = 5
			},
			{
				type = "fluid-wagon",
				name = "petro-tank2-2",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-tank2-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "petro-tank2-2"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 800,
				capacity = fluidwagonbase*1.5,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
				selection_box = {{-1, -2.703125}, {1, 3.296875}},
				gui_front_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/front-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_center_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/center-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_back_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/back-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_connect_front_center_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/connector-front-center.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_connect_center_back_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/connector-center-back.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_front_center_tank_indiciation =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/1.png",
					width = 32,
					height = 32,
					flags = {"icon"}
				},
				gui_center_back_tank_indiciation =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/2.png",
					width = 32,
					height = 32,
					flags = {"icon"}
				},
				vertical_selection_shift = -0.796875,
				weight = 1500,
				max_speed = 2.5,
				braking_force = 4,
				friction_force = 0.375,
				air_resistance = 0.0075,
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 6,
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
				pictures =
				{
					layers = 
					{
						{
							priority = "very-low",
							width = 256,
							height = 256,
							direction_count = 64,
							filenames =
							{
								"__angelsaddons-petrotrain__/graphics/entity/petro-tank2/petro-tank2.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0, -0.75}
						},
						{
							--flags = { "compressed" },
							width = 256,
							height = 256,
							draw_as_shadow = true,
							direction_count = 64,
							filenames =
							{
								"__angelsaddons-petrotrain__/graphics/entity/petro-tank2/petro-tank2-shadow.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.0, -0.5}
						},
					},
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-wheels.ogg",
						volume = 0.6
					},
					match_volume_to_activity = true,
				},
				crash_trigger = crash_trigger(),
				sound_minimum_speed = 0.5;
				vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
				equipment_grid = "angels-petro-tank-wagon-2",
			},
		
		-- Mk3
			{
				type = "equipment-grid",
				name = "angels-petro-locomotive-3",
				width = 8,
				height = 4,
				equipment_categories = {"angels-energy", "angels-heavy-defense", "angels-movement", "train", "locomotive"}
			},
			{
				type = "equipment-grid",
				name = "angels-petro-tank-wagon-3",
				width = 8,
				height = 4,
				equipment_categories = {"angels-energy", "angels-repair", "angels-heavy-defense", "angels-movement", "train", "cargo-wagon"}
			},
			{
				type = "item-with-entity-data",
				name = "petro-locomotive-3",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-loco-1-ico.png",
				icon_size = 32,
				subgroup = "angels-petrotrain",
				order = "a",
				place_result = "petro-locomotive-3",
				stack_size = 5
			},
			{
				type = "locomotive",
				name = "petro-locomotive-3",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-loco-1-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "petro-locomotive-3"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1700,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
				selection_box = {{-1, -3}, {1, 3}},
				drawing_box = {{-1, -4}, {1, 3}},
				weight = 2000,
				max_speed = 2,
				max_power = "1200kW",
				reversing_power_modifier = 1,
				braking_force = 20,
				friction_force = 0.25,
				vertical_selection_shift = -0.5,
				air_resistance = 0.004, -- this is a percentage of current speed that will be subtracted
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-petro-locomotive-3",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				burner =
				{
					fuel_category = "chemical",
					effectivity = 1.4,
					fuel_inventory_size = 5,
					smoke =
					{
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0, 3},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						}
					}
				},
				front_light =
				{
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {-0.6, -16},
						size = 2,
						intensity = 0.6
					},
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {0.6, -16},
						size = 2,
						intensity = 0.6
					}
				},
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
				pictures =
				{
					priority = "very-low",
					width = 256,
					height = 256,
					direction_count = 128,
					filenames =
					{
						"__angelsaddons-petrotrain__/graphics/entity/petro-loco1/petro-loco1-1.png",
						"__angelsaddons-petrotrain__/graphics/entity/petro-loco1/petro-loco1-2.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0.0, -0.75}
				},
				{
					priority = "very-low",
					flags = { "compressed" },
					width = 256,
					height = 256,
					direction_count = 128,
					draw_as_shadow = true,
					filenames =
					{
						"__angelsaddons-petrotrain__/graphics/entity/petro-loco1/petro-loco1-shadow-1.png",
						"__angelsaddons-petrotrain__/graphics/entity/petro-loco1/petro-loco1-shadow-2.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = {0.5, -0.5}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				stop_trigger =
				{
					-- left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, -2.7}, {-0.3, -1}}
					},
					-- right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, -2.7}, {0.75, -1}}
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/train-breaks.ogg",
								volume = 0.6
							},
						}
					},
				},
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-engine.ogg",
						volume = 0.4
					},
					match_speed_to_activity = true,
				},
				open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
				close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
				sound_minimum_speed = 0.5;
			},
			
			{
				type = "item-with-entity-data",
				name = "petro-tank1-3",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-tank1-ico.png",
				icon_size = 32,
				subgroup = "angels-petrotrain",
				order = "b",
				place_result = "petro-tank1-3",
				stack_size = 5
			},
			{
				type = "fluid-wagon",
				name = "petro-tank1-3",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-tank1-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "petro-tank1-3"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1000,
				capacity = fluidwagonbase*2,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
				selection_box = {{-1, -2.703125}, {1, 3.296875}},
				gui_front_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/front-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_center_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/center-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_back_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/back-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_connect_front_center_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/connector-front-center.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_connect_center_back_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/connector-center-back.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_front_center_tank_indiciation =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/1.png",
					width = 32,
					height = 32,
					flags = {"icon"}
				},
				gui_center_back_tank_indiciation =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/2.png",
					width = 32,
					height = 32,
					flags = {"icon"}
				},
				vertical_selection_shift = -0.796875,
				weight = 2000,
				max_speed = 3.5,
				braking_force = 5,
				friction_force = 0.25,
				air_resistance = 0.005,
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 6,
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
				pictures =
				{
					layers =
					{
						{
							priority = "very-low",
							width = 256,
							height = 256,
							direction_count = 64,
							filenames =
							{
								"__angelsaddons-petrotrain__/graphics/entity/petro-tank1/petro-tank1.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0, -0.75}
						},
						{
							flags = { "compressed" },
							width = 256,
							height = 256,
							draw_as_shadow = true,
							direction_count = 64,
							filenames =
							{
								"__angelsaddons-petrotrain__/graphics/entity/petro-tank1/petro-tank1-shadow.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.5, -0.5}
						},
					},
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-wheels.ogg",
						volume = 0.6
					},
					match_volume_to_activity = true,
				},
				crash_trigger = crash_trigger(),
				sound_minimum_speed = 0.5;
				vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
				equipment_grid = "angels-petro-tank-wagon-3",
			},
			{
				type = "item-with-entity-data",
				name = "petro-tank2-3",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-tank2-ico.png",
				icon_size = 32,
				subgroup = "angels-petrotrain",
				order = "c",
				place_result = "petro-tank2-3",
				stack_size = 5
			},
			{
				type = "fluid-wagon",
				name = "petro-tank2-3",
				icon = "__angelsaddons-petrotrain__/graphics/icons/petro-tank2-ico.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "petro-tank2-3"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1000,
				capacity = fluidwagonbase*2,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
				selection_box = {{-1, -2.703125}, {1, 3.296875}},
				gui_front_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/front-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_center_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/center-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_back_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/back-tank.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_connect_front_center_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/connector-front-center.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_connect_center_back_tank =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/connector-center-back.png",
					width = 64,
					height = 64,
					flags = {"icon"}
				},
				gui_front_center_tank_indiciation =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/1.png",
					width = 32,
					height = 32,
					flags = {"icon"}
				},
				gui_center_back_tank_indiciation =
				{
					filename = "__base__/graphics/entity/fluid-wagon/gui/2.png",
					width = 32,
					height = 32,
					flags = {"icon"}
				},
				vertical_selection_shift = -0.796875,
				weight = 2000,
				max_speed = 3.5,
				braking_force = 5,
				friction_force = 0.25,
				air_resistance = 0.005,
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 6,
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
				pictures =
				{
					layers = 
					{
						{
							priority = "very-low",
							width = 256,
							height = 256,
							direction_count = 64,
							filenames =
							{
								"__angelsaddons-petrotrain__/graphics/entity/petro-tank2/petro-tank2.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0, -0.75}
						},
						{
							--flags = { "compressed" },
							width = 256,
							height = 256,
							draw_as_shadow = true,
							direction_count = 64,
							filenames =
							{
								"__angelsaddons-petrotrain__/graphics/entity/petro-tank2/petro-tank2-shadow.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.0, -0.5}
						},
					},
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-wheels.ogg",
						volume = 0.6
					},
					match_volume_to_activity = true,
				},
				crash_trigger = crash_trigger(),
				sound_minimum_speed = 0.5;
				vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
				equipment_grid = "angels-petro-tank-wagon-3",
			},
		}
	)
end

if mods["angelsaddons-smeltingtrain"] then
	data:extend(
		{
		-- Mk2
			{
				type = "equipment-grid",
				name = "angels-smelting-locomotive-2",
				width = 8,
				height = 3,
				equipment_categories = {"angels-void", "train", "locomotive"}		--"angels-energy", "angels-heavy-defense", "angels-movement"
			},
			{
				type = "equipment-grid",
				name = "angels-smelting-wagon-2",
				width = 8,
				height = 3,
				equipment_categories = {"angels-void", "train", "cargo-wagon"}		--"angels-energy", "angels-repair", "angels-heavy-defense", "angels-construction", "angels-movement"
			},
			{
				type = "item-with-entity-data",
				name = "smelting-locomotive-2",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-1.png",
				icon_size = 32,
				subgroup = "angels-smeltingtrain",
				order = "a",
				place_result = "smelting-locomotive-2",
				stack_size = 5
			},
			{
				type = "locomotive",
				name = "smelting-locomotive-2",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-1.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "smelting-locomotive-2"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1350,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
				selection_box = {{-1, -3}, {1, 3}},
				drawing_box = {{-1, -4}, {1, 3}},
				--alert_icon_shift = util.by_pixel(0, -24),
				weight = 2000,
				max_speed = 1.7,
				max_power = "900kW",
				reversing_power_modifier = 0.8,
				braking_force = 15,
				friction_force = 0.375,
				vertical_selection_shift = -0.5,
				air_resistance = 0.005625, -- this is a percentage of current speed that will be subtracted
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-smelting-locomotive-2",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				burner =
				{
					fuel_category = "chemical",
					effectivity = 1.2,
					fuel_inventory_size = 4,
					smoke =
					{
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0.5, 2},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {-0.5, 2},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0.5, 0},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {-0.5, 0},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						}
					}
				},
				front_light =
				{
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {-0.6, -16},
						size = 2,
						intensity = 0.6
					},
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {0.6, -16},
						size = 2,
						intensity = 0.6
					}
				},
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
				pictures =
				{
					layers =
					{
						{
							priority = "very-low",
							width = 256,
							height = 256,
							direction_count = 128,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco1/smelting-loco1-1.png",
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco1/smelting-loco1-2.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.0, -0.75}
						},
						{
							priority = "very-low",
							flags = { "compressed" },
							width = 256,
							height = 256,
							direction_count = 128,
							draw_as_shadow = true,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco1/smelting-loco1-shadow-1.png",
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco1/smelting-loco1-shadow-2.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.5, -0.5}
						}
					}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				stop_trigger =
				{
					-- left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, -2.7}, {-0.3, -1}}
					},
					-- right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, -2.7}, {0.75, -1}}
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/train-breaks.ogg",
								volume = 0.6
							},
						}
					},
				},
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-engine.ogg",
						volume = 0.4
					},
					match_speed_to_activity = true,
				},
				open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
				close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
				sound_minimum_speed = 0.5,
			},
			{
				type = "item-with-entity-data",
				name = "smelting-locomotive-tender-2",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-tender.png",
				icon_size = 32,
				subgroup = "angels-smeltingtrain",
				order = "b",
				place_result = "smelting-locomotive-tender-2",
				stack_size = 5
			},
			{
				type = "locomotive",
				name = "smelting-locomotive-tender-2",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-tender.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "smelting-locomotive-tender-2"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1350,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
				selection_box = {{-1, -3}, {1, 3}},
				drawing_box = {{-1, -4}, {1, 3}},
				weight = 2500,
				max_speed = 1.7,
				max_power = "1100kW",
				reversing_power_modifier = 0.8,
				braking_force = 20,
				friction_force = 0.375,
				vertical_selection_shift = -0.5,
				air_resistance = 0.005625, -- this is a percentage of current speed that will be subtracted
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-smelting-locomotive-2",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				burner =
				{
					fuel_category = "chemical",
					effectivity = 1.2,
					fuel_inventory_size = 4,
					smoke =
					{
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0.5, 2},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {-0.5, 2},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0.5, 0},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {-0.5, 0},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						}
					}
				},
				front_light =
				{
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {-0.6, -16},
						size = 2,
						intensity = 0.6
					},
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {0.6, -16},
						size = 2,
						intensity = 0.6
					}
				},
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
				pictures =
				{
					layers =
					{
						{
							priority = "very-low",
							width = 256,
							height = 256,
							direction_count = 128,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco2/smelting-loco2-1.png",
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco2/smelting-loco2-2.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.0, -0.75}
						},
						{
							priority = "very-low",
							flags = { "compressed" },
							width = 256,
							height = 256,
							direction_count = 128,
							draw_as_shadow = true,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco2/smelting-loco2-shadow-1.png",
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco2/smelting-loco2-shadow-2.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.5, -0.5}
						}
					}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				stop_trigger =
				{
					-- front left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, -2.7}, {-0.3, -1}}
					},
					-- front right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, -2.7}, {0.75, -1}}
					},
					-- rear left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, 2.7}, {-0.3, 1}}
					},
					-- rear right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, 2.7}, {0.75, 1}}
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/train-breaks.ogg",
								volume = 0.6
							},
						}
					},
				},
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-engine.ogg",
						volume = 0.4
					},
					match_speed_to_activity = true,
				},
				open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
				close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
				sound_minimum_speed = 0.5;
			},
			{
				type = "item-with-entity-data",
				name = "smelting-wagon-2",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-wagon1.png",
				icon_size = 32,
				subgroup = "angels-smeltingtrain",
				order = "c",
				place_result = "smelting-wagon-2",
				stack_size = 5
			},
			{
				type = "cargo-wagon",
				name = "smelting-wagon-2",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-wagon1.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				inventory_size = 60,
				minable = {mining_time = 1, result = "smelting-wagon-2"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 800,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
				selection_box = {{-1, -2.703125}, {1, 3.296875}},
				vertical_selection_shift = -0.796875,
				weight = 1500,
				max_speed = 2.5,
				braking_force = 4,
				friction_force = 0.375,
				air_resistance = 0.0075,
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-smelting-wagon-2",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
				pictures =
				{
					layers =
					{
						{
							priority = "very-low",
							width = 256,
							height = 256,
							direction_count = 64,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-wagon1/smelting-wagon1-1.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.0, -0.75},
							back_equals_front = true,
						},
						{
							priority = "very-low",
							flags = { "compressed" },
							width = 256,
							height = 256,
							direction_count = 64,
							draw_as_shadow = true,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-wagon1/smelting-wagon1-shadow-1.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.5, -0.5}
						}
					}
				},
				horizontal_doors =
				{
					layers =
					{
						{
							filename = "__angelsaddons-smeltingtrain__/graphics/entity/smelting-wagon1/smelting-wagon1-door-horizontal.png",
							line_length = 8,
							width = 256,
							height = 256,
							frame_count = 8,
							shift = {0.0, -0.75},
						},
					}
				},
				vertical_doors =
				{
					layers =
					{
						{
							filename = "__angelsaddons-smeltingtrain__/graphics/entity/smelting-wagon1/smelting-wagon1-door-vertical.png",
							line_length = 8,
							width = 256,
							height = 256,
							frame_count = 8,
							shift = {0.0, -0.75},
						},
					}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-wheels.ogg",
						volume = 0.6
					},
					match_volume_to_activity = true
				},
				crash_trigger = crash_trigger(),
				open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
				close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
				sound_minimum_speed = 0.5;
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
			},
		
        -- Mk3
			{
				type = "equipment-grid",
				name = "angels-smelting-locomotive-3",
				width = 8,
				height = 4,
				equipment_categories = {"angels-void", "train", "locomotive"}		--"angels-energy", "angels-heavy-defense", "angels-movement"
			},
			{
				type = "equipment-grid",
				name = "angels-smelting-wagon-3",
				width = 8,
				height = 4,
				equipment_categories = {"angels-void", "train", "cargo-wagon"}		--"angels-energy", "angels-repair", "angels-heavy-defense", "angels-construction", "angels-movement"
			},
			{
				type = "item-with-entity-data",
				name = "smelting-locomotive-3",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-1.png",
				icon_size = 32,
				subgroup = "angels-smeltingtrain",
				order = "a",
				place_result = "smelting-locomotive-3",
				stack_size = 5
			},
			{
				type = "locomotive",
				name = "smelting-locomotive-3",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-1.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "smelting-locomotive-3"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1700,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
				selection_box = {{-1, -3}, {1, 3}},
				drawing_box = {{-1, -4}, {1, 3}},
				--alert_icon_shift = util.by_pixel(0, -24),
				weight = 2000,
				max_speed = 2,
				max_power = "1200kW",
				reversing_power_modifier = 1,
				braking_force = 20,
				friction_force = 0.25,
				vertical_selection_shift = -0.5,
				air_resistance = 0.004, -- this is a percentage of current speed that will be subtracted
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-smelting-locomotive-3",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				burner =
				{
					fuel_category = "chemical",
					effectivity = 1.4,
					fuel_inventory_size = 5,
					smoke =
					{
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0.5, 2},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {-0.5, 2},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0.5, 0},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {-0.5, 0},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						}
					}
				},
				front_light =
				{
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {-0.6, -16},
						size = 2,
						intensity = 0.6
					},
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {0.6, -16},
						size = 2,
						intensity = 0.6
					}
				},
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
				pictures =
				{
					layers =
					{
						{
							priority = "very-low",
							width = 256,
							height = 256,
							direction_count = 128,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco1/smelting-loco1-1.png",
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco1/smelting-loco1-2.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.0, -0.75}
						},
						{
							priority = "very-low",
							flags = { "compressed" },
							width = 256,
							height = 256,
							direction_count = 128,
							draw_as_shadow = true,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco1/smelting-loco1-shadow-1.png",
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco1/smelting-loco1-shadow-2.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.5, -0.5}
						}
					}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				stop_trigger =
				{
					-- left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, -2.7}, {-0.3, -1}}
					},
					-- right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, -2.7}, {0.75, -1}}
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/train-breaks.ogg",
								volume = 0.6
							},
						}
					},
				},
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-engine.ogg",
						volume = 0.4
					},
					match_speed_to_activity = true,
				},
				open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
				close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
				sound_minimum_speed = 0.5,
			},
			{
				type = "item-with-entity-data",
				name = "smelting-locomotive-tender-3",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-tender.png",
				icon_size = 32,
				subgroup = "angels-smeltingtrain",
				order = "b",
				place_result = "smelting-locomotive-tender-3",
				stack_size = 5
			},
			{
				type = "locomotive",
				name = "smelting-locomotive-tender-3",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-tender.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				minable = {mining_time = 1, result = "smelting-locomotive-tender-3"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1700,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
				selection_box = {{-1, -3}, {1, 3}},
				drawing_box = {{-1, -4}, {1, 3}},
				weight = 2500,
				max_speed = 2,
				max_power = "1100kW",
				reversing_power_modifier = 1,
				braking_force = 25,
				friction_force = 0.25,
				vertical_selection_shift = -0.5,
				air_resistance = 0.004, -- this is a percentage of current speed that will be subtracted
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-smelting-locomotive-3",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				burner =
				{
					fuel_category = "chemical",
					effectivity = 1.4,
					fuel_inventory_size = 5,
					smoke =
					{
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0.5, 2},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {-0.5, 2},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {0.5, 0},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						},
						{
							name = "train-smoke",
							deviation = {0.3, 0.3},
							frequency = 100,
							position = {-0.5, 0},
							starting_frame = 0,
							starting_frame_deviation = 60,
							height = 2,
							height_deviation = 0.5,
							starting_vertical_speed = 0.2,
							starting_vertical_speed_deviation = 0.1,
						}
					}
				},
				front_light =
				{
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {-0.6, -16},
						size = 2,
						intensity = 0.6
					},
					{
						type = "oriented",
						minimum_darkness = 0.3,
						picture =
						{
							filename = "__core__/graphics/light-cone.png",
							priority = "medium",
							scale = 2,
							width = 200,
							height = 200
						},
						shift = {0.6, -16},
						size = 2,
						intensity = 0.6
					}
				},
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
				pictures =
				{
					layers =
					{
						{
							priority = "very-low",
							width = 256,
							height = 256,
							direction_count = 128,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco2/smelting-loco2-1.png",
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco2/smelting-loco2-2.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.0, -0.75}
						},
						{
							priority = "very-low",
							flags = { "compressed" },
							width = 256,
							height = 256,
							direction_count = 128,
							draw_as_shadow = true,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco2/smelting-loco2-shadow-1.png",
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-loco2/smelting-loco2-shadow-2.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.5, -0.5}
						}
					}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				stop_trigger =
				{
					-- front left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, -2.7}, {-0.3, -1}}
					},
					-- front right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, -2.7}, {0.75, -1}}
					},
					-- rear left side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the left
						speed = {-0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{-0.75, 2.7}, {-0.3, 1}}
					},
					-- rear right side
					{
						type = "create-trivial-smoke",
						repeat_count = 50,  --125
						smoke_name = "smoke-train-stop",
						initial_height = 0,
						-- smoke goes to the right
						speed = {0.03, 0},
						speed_multiplier = 0.75,
						speed_multiplier_deviation = 1.1,
						offset_deviation = {{0.3, 2.7}, {0.75, 1}}
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/train-breaks.ogg",
								volume = 0.6
							},
						}
					},
				},
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-engine.ogg",
						volume = 0.4
					},
					match_speed_to_activity = true,
				},
				open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
				close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
				sound_minimum_speed = 0.5;
			},
			{
				type = "item-with-entity-data",
				name = "smelting-wagon-3",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-wagon1.png",
				icon_size = 32,
				subgroup = "angels-smeltingtrain",
				order = "c",
				place_result = "smelting-wagon-3",
				stack_size = 5
			},
			{
				type = "cargo-wagon",
				name = "smelting-wagon-3",
				icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-wagon1.png",
				icon_size = 32,
				flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
				inventory_size = 80,
				minable = {mining_time = 1, result = "smelting-wagon-3"},
				mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
				max_health = 1000,
				corpse = "medium-remnants",
				dying_explosion = "medium-explosion",
				collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
				selection_box = {{-1, -2.703125}, {1, 3.296875}},
				vertical_selection_shift = -0.796875,
				weight = 2000,
				max_speed = 3.5,
				braking_force = 5,
				friction_force = 0.25,
				air_resistance = 0.005,
				connection_distance = 3,
				joint_distance = 4,
				energy_per_hit_point = 5,
				equipment_grid = "angels-smelting-wagon-3",
				resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
				back_light = rolling_stock_back_light(),
				stand_by_light = rolling_stock_stand_by_light(),
				color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
				pictures =
				{
					layers =
					{
						{
							priority = "very-low",
							width = 256,
							height = 256,
							direction_count = 64,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-wagon1/smelting-wagon1-1.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.0, -0.75},
							back_equals_front = true,
						},
						{
							priority = "very-low",
							flags = { "compressed" },
							width = 256,
							height = 256,
							direction_count = 64,
							draw_as_shadow = true,
							filenames =
							{
								"__angelsaddons-smeltingtrain__/graphics/entity/smelting-wagon1/smelting-wagon1-shadow-1.png",
							},
							line_length = 8,
							lines_per_file = 8,
							shift = {0.5, -0.5}
						}
					}
				},
				horizontal_doors =
				{
					layers =
					{
						{
							filename = "__angelsaddons-smeltingtrain__/graphics/entity/smelting-wagon1/smelting-wagon1-door-horizontal.png",
							line_length = 8,
							width = 256,
							height = 256,
							frame_count = 8,
							shift = {0.0, -0.75},
						},
					}
				},
				vertical_doors =
				{
					layers =
					{
						{
							filename = "__angelsaddons-smeltingtrain__/graphics/entity/smelting-wagon1/smelting-wagon1-door-vertical.png",
							line_length = 8,
							width = 256,
							height = 256,
							frame_count = 8,
							shift = {0.0, -0.75},
						},
					}
				},
				wheels = standard_train_wheels,
				rail_category = "regular",
				drive_over_tie_trigger = drive_over_tie(),
				tie_distance = 50,
				working_sound =
				{
					sound =
					{
						filename = "__base__/sound/train-wheels.ogg",
						volume = 0.6
					},
					match_volume_to_activity = true
				},
				crash_trigger = crash_trigger(),
				open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
				close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
				sound_minimum_speed = 0.5;
				vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
			},
		}
	)
end

if mods["boblogistics"] then
data:extend(
    {
        {
            type = "equipment-category",
            name = "bot-wagon"
        },            
        {
            type = "equipment-grid",
            name = "bob-bot-wagon-1",
            width = 9,
            height = 5,
            equipment_categories = {"angels-energy", "angels-repair", "angels-heavy-defense", "angels-construction", "angels-movement", "train", "cargo-wagon", "bot-wagon"}
        },
        {
            type = "equipment-grid",
            name = "bob-bot-wagon-2",
            width = 10,
            height = 6,
            equipment_categories = {"angels-energy", "angels-repair", "angels-heavy-defense", "angels-construction", "angels-movement", "train", "cargo-wagon", "bot-wagon"}
        },
        {
            type = "equipment-grid",
            name = "bob-bot-wagon-3",
            width = 11,
            height = 7,
            equipment_categories = {"angels-energy", "angels-repair", "angels-heavy-defense", "angels-construction", "angels-movement", "train", "cargo-wagon", "bot-wagon"}
        },
       {
            type = "item-with-entity-data",
            name = "bob-cargo-bot-wagon-1",
            icon = "__base__/graphics/icons/cargo-wagon.png",
            icon_size = 32,
            subgroup = "bob-cargo-wagon",
            order = "a[train-system]-f[cargo-bot-wagon-1]",
            place_result = "bob-cargo-bot-wagon-1",
            stack_size = 10
        },
        util.merge{data.raw["cargo-wagon"]["cargo-wagon"],
            {
                name = "bob-cargo-bot-wagon-1",
                minable = {result = "bob-cargo-bot-wagon-1"},
                inventory_size = 50,
                max_health = 800,
                weight = 1000,
                max_speed = 1.5,
                braking_force = 3,
                friction_force = 0.5,
                air_resistance = 0.01,
                resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
                color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
                equipment_grid = "bob-bot-wagon-1",
            }
        },
        {
            type = "item-with-entity-data",
            name = "bob-cargo-bot-wagon-2",
            icon = "__base__/graphics/icons/cargo-wagon.png",
            icon_size = 32,
            subgroup = "bob-cargo-wagon",
            order = "a[train-system]-f[cargo-bot-wagon-2]",
            place_result = "bob-cargo-bot-wagon-2",
            stack_size = 10
        },
        util.merge{data.raw["cargo-wagon"]["cargo-wagon"],
            {
                name = "bob-cargo-bot-wagon-2",
                minable = {result = "bob-cargo-bot-wagon-2"},
                inventory_size = 70,
                max_health = 800,
                weight = 1500,--original is 1000
                max_speed = 2.5,--1.5
                braking_force = 4,--3
                friction_force = 0.375,--0.5
                air_resistance = 0.0075,--0.01
                resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
                color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
                equipment_grid = "bob-bot-wagon-2",
            }
        },
        {
            type = "item-with-entity-data",
            name = "bob-cargo-bot-wagon-3",
            icon = "__base__/graphics/icons/cargo-wagon.png",
            icon_size = 32,
            subgroup = "bob-cargo-wagon",
            order = "a[train-system]-f[cargo-bot-wagon-3]",
            place_result = "bob-cargo-bot-wagon-3",
            stack_size = 10
        },
        util.merge{data.raw["cargo-wagon"]["cargo-wagon"],
            {
                name = "bob-cargo-bot-wagon-3",
                minable = {result = "bob-cargo-bot-wagon-3"},
                inventory_size = 90,
                max_health = 1000,
                weight = 2000,
                max_speed = 3.5,
                braking_force = 5,
                friction_force = 0.25,
                air_resistance = 0.005,
                resistances = {
                    {
                        type = "fire",
                        decrease = 15,
                        percent = 50
                    },
                    {
                        type = "physical",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "impact",
                        decrease = 50,
                        percent = 60
                    },
                    {
                        type = "explosion",
                        decrease = 15,
                        percent = 30
                    },
                    {
                        type = "acid",
                        decrease = 5,
                        percent = 20
                    },
                    {
                        type = "laser",
                        decrease = 10,
                        percent = 30,
                    },
                    {
                        type = "poison",
                        decrease = 15,
                        percent = 60,
                    },
                },
                color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
                equipment_grid = "bob-bot-wagon-3",
            }
        }
    }
)
end
