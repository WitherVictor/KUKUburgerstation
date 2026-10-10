/material/
	var/name = "material"
	var/display_name = "材料"
	var/desc = "Pun."
	var/desc_extended = "Information about this material."

	var/color = "#FFFFFF"
	var/wall_health = 0
	var/icon_state_sheet = "sheet"
	var/icon_state_rod = "rod"
	var/icon_state_ingot = "ingot"
	var/icon_state_ore
	var/icon_state_ore_deposit

	var/weight_per_unit = 0.1
	var/value_per_unit = 1

	var/armor/armor = /armor/structure/steel //This is used for constructables, like turfs or machines.

	var/reagent
	var/reagent_amount = 10

/material/grass/
	name = "grass"
	display_name = "草"
	color = COLOR_GREEN

	value_per_unit = 1

/material/dirt/
	name = "dirt"
	display_name = "泥土"
	color = COLOR_BROWN

	value_per_unit = 0.5


/material/cobalt/
	name = "cobalt"
	display_name = "钴"
	color = COLOR_BLUE

	value_per_unit = 1
	wall_health = 500


/material/rock/
	name = "rock"
	display_name = "岩石"
	color = COLOR_ROCK
	wall_health = 250
	value_per_unit = 1

/material/glass/
	name = "glass"
	display_name = "玻璃"
	color = COLOR_GLASS
	wall_health = 25
	icon_state_sheet = "glass"

	icon_state_ore = "ore_sand"

	value_per_unit = 3

/material/steel
	name = "steel"
	display_name = "钢"
	color = COLOR_STEEL
	wall_health = 1000
	value_per_unit = 9

	reagent = /reagent/steel

/material/copper
	name = "copper"
	display_name = "铜"
	color = "#E28446"
	wall_health = 250
	value_per_unit = 4

	reagent = /reagent/copper

/material/aluminium
	name = "aluminium"
	display_name = "铝"
	color = COLOR_ALUMINIUM
	value_per_unit = 12
	wall_health = 100

	reagent = /reagent/aluminium

/material/brass
	name = "brass"
	display_name = "黄铜"
	color = "#e7a831"
	value_per_unit = 15
	wall_health = 750

	reagent = /reagent/brass

/material/iron
	name = "iron"
	display_name = "铁"
	color = COLOR_IRON
	icon_state_ore = "ore_iron"
	icon_state_ore_deposit = "deposit_iron"
	wall_health = 500
	value_per_unit = 7

	reagent = /reagent/iron

/material/phoron
	name = "phoron"
	display_name = "佛隆"
	color = COLOR_PHORON
	icon_state_ore = "ore_phoron"
	icon_state_ore_deposit = "deposit_phoron"
	wall_health = 10
	value_per_unit = 20

	reagent = /reagent/fuel/phoron

/material/carbon
	name = "carbon"
	display_name = "碳"
	color = COLOR_CARBON
	icon_state_ore = "ore_coal"
	icon_state_ore_deposit = "deposit_coal"
	wall_health = 10
	value_per_unit = 5

	reagent = /reagent/carbon

/material/gold
	name = "gold"
	display_name = "金"
	color = COLOR_GOLD
	icon_state_ore = "ore_gold"
	icon_state_ore_deposit = "deposit_gold"
	wall_health = 50
	value_per_unit = 40

	reagent = /reagent/gold

/material/platinum
	name = "platinum"
	display_name = "铂"
	color = COLOR_PLATINUM
	icon_state_ore = "ore_platinum"
	icon_state_ore_deposit = "deposit_platinum"
	wall_health = 250
	value_per_unit = 30

	reagent = /reagent/platinum

/material/diamond
	name = "diamond"
	display_name = "钻石"
	color = COLOR_DIAMOND
	icon_state_ore = "ore_diamond"
	icon_state_ore_deposit = "deposit_diamond"
	wall_health = 1500
	value_per_unit = 100

	reagent = /reagent/diamond

/material/silver
	name = "silver"
	display_name = "银"
	color = COLOR_SILVER
	icon_state_ore = "ore_silver"
	icon_state_ore_deposit = "deposit_silver"
	wall_health = 250
	value_per_unit = 30

	reagent = /reagent/silver

/material/uranium
	name = "uranium"
	display_name = "铀"
	color = COLOR_URANIUM
	icon_state_ore = "ore_uranium"
	icon_state_ore_deposit = "deposit_uranium"
	wall_health = 100
	value_per_unit = 35

	reagent = /reagent/radioactive/uranium

/material/titanium
	name = "titanium"
	display_name = "钛"
	color = COLOR_TITANIUM
	icon_state_ore = "ore_titanium"
	icon_state_ore_deposit = "deposit_titanium"
	wall_health = 1250
	value_per_unit = 25

	reagent = /reagent/titanium

/material/plasteel
	name = "plasteel"
	display_name = "塑钢"
	color = COLOR_PLASTEEL
	wall_health = 2000
	value_per_unit = 25

	reagent = /reagent/plasteel

/material/wood
	name = "wood"
	display_name = "木材"
	color = COLOR_WOOD
	value_per_unit = 5
	wall_health = 50

	reagent = /reagent/wood

/material/adamantium_carbon
	name = "adamantium-carbon"
	display_name = "精金碳复合材料"
	color = COLOR_ADAMANITUM_CARBON
	value_per_unit = 2000
	wall_health = INFINITY
