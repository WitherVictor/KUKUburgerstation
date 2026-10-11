/obj/item/clothing/belt/storage
	name = "皮腰带"
	icon = 'icons/obj/item/clothing/belts/tool.dmi'
	desc = "4力量、4体力的皮腰带，18级。"
	desc_extended = "能存放不少物品，取用方便快捷。"

	is_container = TRUE

	dynamic_inventory_count = MAX_INVENTORY_X

	size = MAX_INVENTORY_X*SIZE_1

	container_max_size = SIZE_2

	armor = /armor/leather


	value = 40

/obj/item/clothing/belt/storage/tool/filled/fill_inventory()
	new /obj/item/weapon/melee/tool/crowbar(src)
	new /obj/item/weapon/melee/tool/multitool(src)
	new /obj/item/weapon/melee/tool/pickaxe(src)
	new /obj/item/weapon/melee/tool/screwdriver(src)
	new /obj/item/weapon/melee/tool/wirecutters(src)
	new /obj/item/weapon/melee/tool/wrench(src)
	. = ..()

/obj/item/clothing/belt/storage/medical
	name = "医疗腰带"
	icon = 'icons/obj/item/clothing/belts/medical.dmi'
	desc_extended = "能存放不少物品，取用方便快捷。这条采用医疗主题设计。"

/obj/item/clothing/belt/storage/medical/filled
	value_burgerbux = 1

/obj/item/clothing/belt/storage/medical/filled/fill_inventory()
	new /obj/item/container/simple/beaker/bottle/bicaridine(src)
	new /obj/item/container/simple/beaker/bottle/kelotane(src)
	new /obj/item/container/simple/beaker/bottle/dylovene(src)
	new /obj/item/container/syringe/hypodermic(src)
	new /obj/item/container/healing/trauma_kit(src)
	new /obj/item/container/healing/burn_kit(src)
	new /obj/item/container/spray/silver_sulfadiazine(src)
	new /obj/item/container/spray/styptic_powder(src)
	. = ..()


/obj/item/clothing/belt/suspenders
	name = "红色吊带"
	icon = 'icons/obj/item/clothing/suit/suspenders.dmi'
	desc = "吊起默剧的幻象。"
	desc_extended = "漂亮的红色吊带，可存放少量物品，同时为躯干和腹股沟提供更好的防护。"

	is_container = TRUE

	dynamic_inventory_count = 6

	size = MAX_INVENTORY_X*SIZE_1

	container_max_size = SIZE_2

	armor = /armor/cloth/reduced

	protected_limbs = list(BODY_GROIN,BODY_TORSO)

	value = 40
