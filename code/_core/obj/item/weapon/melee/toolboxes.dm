/obj/item/weapon/melee/toolbox
	name = "工具箱"
	desc = "警告：极其结实。"
	desc_extended = "主要被最粗鲁愚笨的雇佣兵拿来砸人的工具箱。也能用来装工具。"
	icon = 'icons/obj/item/weapons/melee/toolbox/red.dmi'
	damage_type = /damagetype/item/heavy

	value = 10

	size = SIZE_3
	weight = 10

	is_container = TRUE
	container_max_size = SIZE_2

	dynamic_inventory_count = 6

/obj/item/weapon/melee/toolbox/red
	color = "#FF0000"

/obj/item/weapon/melee/toolbox/red/emergency
	name = "应急工具箱"

/obj/item/weapon/melee/toolbox/red/emergency/Generate()
	new /obj/item/weapon/melee/tool/crowbar(src)
	new /obj/item/weapon/melee/torch/flashlight(src)
	new /obj/item/flare(src)
	new /obj/item/weapon/ranged/bullet/magazine/pistol/dip(src)
	new /obj/item/magazine/dip_22(src)
	new /obj/item/weapon/melee/energy/grazer(src)
	. = ..()

/obj/item/weapon/melee/toolbox/green
	color = "#00FF00"

/obj/item/weapon/melee/toolbox/blue
	color = "#0000FF"

/obj/item/weapon/melee/toolbox/yellow
	color = "#FFFF00"


/obj/item/weapon/melee/toolbox/syndicate
	name = "满载的黑色工具箱"
	color = COLOR_GREY_DARK

	rarity = RARITY_RARE

/obj/item/weapon/melee/toolbox/syndicate/Generate()
	new /obj/item/weapon/melee/tool/crowbar(src)
	new /obj/item/weapon/melee/tool/multitool(src)
	new /obj/item/weapon/melee/tool/screwdriver(src)
	new /obj/item/weapon/melee/tool/wirecutters(src)
	new /obj/item/weapon/melee/tool/wrench(src)
	new /obj/item/weapon/melee/torch/flashlight(src)
	return ..()

/obj/item/weapon/melee/toolbox/gold
	name = "黄金工具箱"
	desc = "警告：闪闪发光！"
	desc_extended = "颁发给最能打的助理的镀金工具箱。也能用来装工具。"
	icon = 'icons/obj/item/weapons/melee/toolbox/gold.dmi'
	damage_type = /damagetype/melee/club/gold_toolbox

	value = 5000

	rarity = RARITY_LEGENDARY
