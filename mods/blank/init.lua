--[[

	INDEX

	0--ONJOINPLAYER
	1--HAND
	2--NODES	
	3--BIOMES
	4--DECORATIONS
	5--ORES
	6--COLOR MESSAGES

	
]]

--0--ONJOINPLAYER

core.register_on_joinplayer(function(player, last_login)

    -- Necessary for shadows
    --player:set_lighting({ shadows = { intensity = 0.5 } })

    local playername = player:get_player_name()
    core.chat_send_player(playername, "Hi " .. playername .. "!")


end)

--1--HAND

core.register_item(':', {
    type = 'none',
    wield_image = 'hand.png',
    wield_scale = {x = 1, y = 1, z = 1},
    range = 20,
    tool_capabilities = {
        full_punch_interval = 0.9,
        max_drop_level = 0,
        damage_groups = {fleshy = 1},
    }
})

--2--NODES

core.register_node('blank:stone', {
    description = 'Stone',
    tiles = { 'stone.png' },
    groups = { dig_immediate = 3 },
    paramtype = "light",
})

core.register_node('blank:water', {
    description = 'Water',
    tiles = { 'water.png' },
    groups = { dig_immediate = 3 },
    paramtype = "light",
})

core.register_node('blank:river_water', {
    description = 'River Water',
    tiles = { 'river_water.png' },
    groups = { dig_immediate = 3 },
    paramtype = "light",
})

core.register_node('blank:grass', {
    description = 'Grass',
    tiles = { 'grass.png' },
    groups = { dig_immediate = 3 },
    paramtype = "light",
})

core.register_node('blank:dirt', {
    description = 'Dirt',
    tiles = { 'dirt.png' },
    groups = { dig_immediate = 3 },
    paramtype = "light",
})

-- Minerals

core.register_node('blank:ruby', {
    description = 'Ruby',
    tiles = { 'ruby.png' },
    groups = { dig_immediate = 3 },
    paramtype = "light",
})

core.register_node('blank:sapphire', {
    description = 'Sapphire',
    tiles = { 'sapphire.png' },
    groups = { dig_immediate = 3 },
    paramtype = "light",
})

core.register_node('blank:emerald', {
    description = 'Emerald',
    tiles = { 'emerald.png' },
    groups = { dig_immediate = 3 },
    paramtype = "light",
})

core.register_node('blank:mese', {
    description = 'Mese',
    tiles = { 'mese.png' },
    groups = { dig_immediate = 3 },
    light_source = 14,
    paramtype = "light",
})

-- Vegetation

core.register_node("blank:flower", {
	description = "Blank Flower",
	drawtype = "plantlike",
	waving = 1,
	tiles = { "flower.png"},
	inventory_image = "flower.png",
	wield_image = "flower.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = { dig_immediate = 3, flower = 1 },
	light_source = 14,
})

core.register_node("blank:long_plant", {
	description = "Long Plant",
	drawtype = "plantlike",
	visual_scale = 2,
	waving = 1,
	tiles = { "long_plant.png"},
	inventory_image = "long_plant.png",
	wield_image = "long_plant.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = { dig_immediate = 3, flower = 1 },
})

core.register_node('blank:wood', {
    description = 'Wood',
    tiles = { 'wood.png' },
    groups = { dig_immediate = 3 },
    paramtype = "light",
})

core.register_node('blank:leaves', {
    description = 'Leaves',
    tiles = { 'leaves.png' },
    groups = { dig_immediate = 3 },
    paramtype = "light",
})

-- THESE ALIAS ARE ESSENTIAL FOR LOADING A V7 MAP

core.register_alias('mapgen_stone', 'blank:stone')
core.register_alias('mapgen_water_source', 'blank:water')
core.register_alias('mapgen_river_water_source', 'blank:river_water')

--3--BIOMES

core.register_biome({
	name = "grassland",
	node_top = "blank:grass",
	depth_top = 1,
	node_filler = "blank:dirt",
	depth_filler = 4,
	node_riverbed = "blank:river_water",
	node_stone = "blank:stone",
	node_water = "blank:water",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = -100,
	heat_point = 10,
	humidity_point = 10,
})


--4--DECORATIONS

core.register_decoration({
	name = "flower",
	deco_type = "simple",
	place_on = {"blank:grass"},
	sidelen = 16,
	fill_ratio = 0.005,
	y_max = 31000,
	y_min = 0,
	decoration = { "blank:blank_flower"},
})

core.register_decoration({
	name = "long_plant",
	deco_type = "simple",
	place_on = {"blank:grass"},
	sidelen = 16,
	fill_ratio = 0.005,
	y_max = 31000,
	y_min = 0,
	decoration = { "blank:long_plant"},
})

core.register_decoration({
	name = "tree",
	deco_type = "schematic",
	place_on = {"blank:grass"},
	place_offset_y = 1,
	sidelen = 16,
	fill_ratio = 0.001,
	biomes = "normalland",
	y_max = 31000,
	y_min = 0,
	schematic = core.get_modpath("blank") .. "/schematics/tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

--5--ORES

core.register_ore({
	ore_type = "scatter",
	ore = "blank:ruby",
	wherein = "blank:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 16,
	clust_size = 16,
	y_max = 31000,
	y_min = -127,
})

core.register_ore({
	ore_type = "scatter",
	ore = "blank:sapphire",
	wherein = "blank:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 16,
	clust_size = 16,
	y_max = 31000,
	y_min = -31000,
})

core.register_ore({
	ore_type = "scatter",
	ore = "blank:emerald",
	wherein = "blank:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 16,
	clust_size = 16,
	y_max = 31000,
	y_min = -31000,
})

core.register_ore({
	ore_type = "scatter",
	ore = "blank:mese",
	wherein = "blank:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 16,
	clust_size = 16,
	y_max = 31000,
	y_min = -31000,
})


--6--SET COLOR MESSAGE

local storage = core.get_mod_storage()

-- Function to get a player's saved color
default_color = "#FFFFFF" -- White
local function get_player_color(player_name)
    return storage:get_string(player_name) ~= "" and storage:get_string(player_name) or default_color
end

-- Command to set chat color
core.register_chatcommand("setcolor", {
    params = "#RRGGBB",
    description = "Set your chat color",
    privs = {},
    func = function(name, param)
        if param:match("^#%x%x%x%x%x%x$") then
            storage:set_string(name, param)
            return true, "Chat color set to " .. param
        else
            return false, "Invalid color format! Use rgb #RRGGBB"
        end
    end,
})

-- Modify player messages
core.register_on_chat_message(function(name, message)
    local color = get_player_color(name)
    core.chat_send_all(core.colorize(color, "<" .. name .. "> " .. message))
    return true -- Stops default chat handling
end)