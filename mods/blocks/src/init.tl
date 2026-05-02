
local record Vec3
	x: number
	y: number
	z: number
end

local record DamageGroups
	fleshy: number
end

local record ToolCapabilities
	full_punch_interval: number
	max_drop_level: number
	damage_groups: DamageGroups
end

local record ItemDef
	type: string
	wield_image: string
	wield_scale: Vec3
	range: number
	tool_capabilities: ToolCapabilities
end

local record Player
	get_player_name: function(self: Player): string
	set_lighting: function(self: Player, settings: table)
end

local record NodeDef
	description: string
	tiles: table
	special_tiles: table
	groups: table
	paramtype: string
	light_source: number
	drawtype: string
	waving: number
	visual_scale: number
	inventory_image: string
	wield_image: string
	sunlight_propagates: boolean
	walkable: boolean
	pointable: boolean
	diggable: boolean
	buildable_to: boolean
	liquidtype: string
	liquid_alternative_flowing: string
	liquid_alternative_source: string
	liquid_viscosity: number
	liquid_renewable: boolean
	liquid_range: number
end

local record BiomeDef
	name: string
	node_top: string
	depth_top: number
	node_filler: string
	depth_filler: number
	node_riverbed: string
	node_stone: string
	node_water: string
	depth_riverbed: number
	y_max: number
	y_min: number
	heat_point: number
	humidity_point: number
end

local record DecorationDef
	name: string
	deco_type: string
	place_on: {string}
	sidelen: number
	fill_ratio: number
	y_max: number
	y_min: number
	decoration: {string}
	place_offset_y: number
	biomes: string
	schematic: string
	flags: string
	rotation: string
end

local record OreDef
	ore_type: string
	ore: string
	wherein: string
	clust_scarcity: number
	clust_num_ores: number
	clust_size: number
	y_max: number
	y_min: number
end

local record Engine
	register_item: function(string, ItemDef)
	register_on_joinplayer: function(function(Player, number))
	chat_send_player: function(string, string)
	register_node: function(string, NodeDef)
	register_alias: function(string, string)
	register_biome: function(BiomeDef)
	register_decoration: function(DecorationDef)
	register_ore: function(OreDef)
	get_modpath: function(string): string
	get_mod_storage: function(): table
	register_chatcommand: function(string, table)
	register_on_chat_message: function(function(string, string): boolean): boolean
	chat_send_all: function(string)
	colorize: function(string, string): string
end

global core: Engine

core.register_on_joinplayer(function(player: Player, _: number)
	player:set_lighting({
		shadows = { intensity = 0.5 },
		bloom = { intensity = 0.05, strength_factor = 1.0, radius = 1.0 },
		volumetric_light = { strength = 0.2 },
	})

	local player_name = player:get_player_name()
	core.chat_send_player(player_name, player_name .. " joined the game.")
end)

core.register_item(':', {
	type = 'none',
	wield_image = 'hand.png',
	wield_scale = {x = 1, y = 1, z = 1},
	range = 20,
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		damage_groups = {fleshy = 1},
	},
})

core.register_node('langeria_blocks:stone', {
  description = 'Stone',
  tiles = { 'stone.png' },
  groups = { dig_immediate = 3 },
})

core.register_node('langeria_blocks:water', {
  description = 'Water',
	drawtype = "liquid",
  tiles = {
			{
					name = "water.png",
					animation = {
							type = "vertical_frames",
							aspect_w = 16,
							aspect_h = 16,
							length = 2.0,
					},
			},
    },
	special_tiles = {
		{
				name = "water.png",
				animation = {
						type = "vertical_frames",
						aspect_w = 16,
						aspect_h = 16,
						length = 2.0,
				},
				backface_culling = false,
		},
	},
  paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	liquidtype = "source",
	liquid_alternative_flowing = "langeria_blocks:water_flowing",
	liquid_alternative_source = "langeria_blocks:water",
	liquid_viscosity = 1,
	liquid_renewable = true,
	liquid_range = 8,
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

core.register_node('langeria_blocks:water_flowing', {
  description = 'Flowing Water',
	drawtype = "flowingliquid",
  tiles = { 'water.png' },
	special_tiles = { 'water.png', 'water.png' },
  paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	liquidtype = "flowing",
	liquid_alternative_flowing = "langeria_blocks:water_flowing",
	liquid_alternative_source = "langeria_blocks:water",
	liquid_viscosity = 1,
	liquid_renewable = true,
	liquid_range = 8,
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

core.register_node('langeria_blocks:river_water', {
  description = 'River Water',
  tiles = { 'river_water.png' },
  groups = { dig_immediate = 3 },
  paramtype = "light",
})

core.register_node('langeria_blocks:grass', {
  description = 'Grass',
  tiles = {
		"grass_top.png",    -- y+
		"dirt.png",  				-- y-
		"grass_side.png", 	-- x+
		"grass_side.png",  	-- x-
		"grass_side.png",  	-- z+
		"grass_side.png", 	-- z-
	},
  groups = { dig_immediate = 3 },
})

core.register_node('langeria_blocks:dirt', {
  description = 'Dirt',
  tiles = { 'dirt.png' },
  groups = { dig_immediate = 3 },
})

-- Minerals

core.register_node('langeria_blocks:ruby', {
  description = 'Ruby',
  tiles = { 'ruby.png' },
  groups = { dig_immediate = 3 },
  paramtype = "light",
})

core.register_node('langeria_blocks:sapphire', {
  description = 'Sapphire',
  tiles = { 'sapphire.png' },
  groups = { dig_immediate = 3 },
  paramtype = "light",
})

core.register_node('langeria_blocks:emerald', {
  description = 'Emerald',
  tiles = { 'emerald.png' },
  groups = { dig_immediate = 3 },
  paramtype = "light",
})

core.register_node('langeria_blocks:mese', {
  description = 'Mese',
  tiles = { 'mese.png' },
  groups = { dig_immediate = 3 },
  light_source = 14,
  paramtype = "light",
})

-- Vegetation

core.register_node("langeria_blocks:flower", {
	description = "langeria_blocks Flower",
	drawtype = "plantlike",
	waving = 1,
	tiles = { "flower.png"},
	inventory_image = "flower.png",
	wield_image = "flower.png",
	sunlight_propagates = true,
	walkable = false,
	groups = { dig_immediate = 3, flower = 1 },
	light_source = 14,
})

core.register_node("langeria_blocks:long_plant", {
	description = "Long Plant",
	drawtype = "plantlike",
	visual_scale = 2,
	waving = 1,
	tiles = { "long_plant.png"},
	inventory_image = "long_plant.png",
	wield_image = "long_plant.png",
	sunlight_propagates = true,
	walkable = false,
	groups = { dig_immediate = 3, flower = 1 },
})

core.register_node('langeria_blocks:wood', {
    description = 'Wood',
    tiles = { 'wood.png' },
    groups = { dig_immediate = 3 },
})

core.register_node('langeria_blocks:leaves', {
    description = 'Leaves',
    tiles = { 'leaves.png' },
    groups = { dig_immediate = 3 },
})

-- THESE ALIAS ARE ESSENTIAL FOR LOADING A V7 MAP

core.register_alias('mapgen_stone', 'langeria_blocks:stone')
core.register_alias('mapgen_water_source', 'langeria_blocks:water')
core.register_alias('mapgen_river_water_source', 'langeria_blocks:river_water')

--3--BIOMES

core.register_biome({
	name = "grassland",
	node_top = "langeria_blocks:grass",
	depth_top = 1,
	node_filler = "langeria_blocks:dirt",
	depth_filler = 4,
	node_riverbed = "langeria_blocks:river_water",
	node_stone = "langeria_blocks:stone",
	node_water = "langeria_blocks:water",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = -100,
	heat_point = 10,
	humidity_point = 10,
})

core.register_ore({
	ore_type = "scatter",
	ore = "langeria_blocks:ruby",
	wherein = "langeria_blocks:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 16,
	clust_size = 16,
	y_max = 31000,
	y_min = -127,
})

core.register_ore({
	ore_type = "scatter",
	ore = "langeria_blocks:sapphire",
	wherein = "langeria_blocks:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 16,
	clust_size = 16,
	y_max = 31000,
	y_min = -31000,
})

core.register_ore({
	ore_type = "scatter",
	ore = "langeria_blocks:emerald",
	wherein = "langeria_blocks:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 16,
	clust_size = 16,
	y_max = 31000,
	y_min = -31000,
})

core.register_ore({
	ore_type = "scatter",
	ore = "langeria_blocks:mese",
	wherein = "langeria_blocks:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 16,
	clust_size = 16,
	y_max = 31000,
	y_min = -31000,
})


-- --6--SET COLOR MESSAGE

-- local storage = core.get_mod_storage()

-- -- Function to get a player's saved color
-- default_color = "#FFFFFF" -- White
-- local function get_player_color(player_name)
--     return storage:get_string(player_name) ~= "" and storage:get_string(player_name) or default_color
-- end

-- -- Command to set chat color
-- core.register_chatcommand("setcolor", {
--     params = "#RRGGBB",
--     description = "Set your chat color",
--     privs = {},
--     func = function(name, param)
--         if param:match("^#%x%x%x%x%x%x$") then
--             storage:set_string(name, param)
--             return true, "Chat color set to " .. param
--         else
--             return false, "Invalid color format! Use rgb #RRGGBB"
--         end
--     end,
-- })

-- -- Modify player messages
-- core.register_on_chat_message(function(name, message)
--     local color = get_player_color(name)
--     core.chat_send_all(core.colorize(color, "<" .. name .. "> " .. message))
--     return true -- Stops default chat handling
-- end)