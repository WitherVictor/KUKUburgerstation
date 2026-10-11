/obj/item/storage/kit/small
	name = "个人急救包"
	desc = "用来装药品。"
	desc_extended = "便携式基础急救包。"
	icon = 'icons/obj/item/storage/kits.dmi'
	icon_state = "firstaid-mini"

	is_container = TRUE

	size = SIZE_2
	container_max_size = SIZE_1
	dynamic_inventory_count = 4

	value = 10

/obj/item/storage/kit/small/filled/fill_inventory()
	new/obj/item/container/healing/bandage(src)
	new/obj/item/container/healing/ointment(src)
	new/obj/item/storage/pillbottle/dylovene_small(src)
	new/obj/item/storage/pillbottle/consumer/painkillers(src)
	. = ..()



/obj/item/storage/kit/small/brute
	name = "个人外伤急救包"
	desc_extended = "主要用于处理物理伤害的急救包。"
	icon_state = "brute-mini"

/obj/item/storage/kit/small/brute/filled/fill_inventory()
	new/obj/item/container/healing/trauma_kit(src)
	new/obj/item/container/healing/patch/brute(src)
	new/obj/item/storage/pillbottle/bicaridine_small(src)
	new/obj/item/container/healing/bone_gel(src)
	. = ..()

/obj/item/storage/kit/small/burn
	name = "个人烧伤急救包"
	desc_extended = "主要用于处理烧伤的急救包。"
	icon_state = "burn-mini"

/obj/item/storage/kit/small/burn/filled/fill_inventory()
	new/obj/item/container/healing/burn_kit(src)
	new/obj/item/container/healing/patch/burn(src)
	new/obj/item/storage/pillbottle/kelotane_small(src)
	//TODO: Sunscreen
	. = ..()

/obj/item/storage/kit/small/toxin
	name = "个人解毒急救包"
	desc_extended = "主要用于处理毒素伤害的急救包。"
	icon_state = "toxin-mini"

/obj/item/storage/kit/small/toxin/filled/fill_inventory()
	new /obj/item/container/syringe/hypodermic(src)
	new /obj/item/container/simple/beaker/bottle/dylovene(src)
	new /obj/item/container/simple/beaker/bottle/charcoal(src)
	new /obj/item/container/simple/beaker/bottle/calomel(src)
	. = ..()

/obj/item/storage/kit/small/rad
	name = "个人抗辐射急救包"
	desc_extended = "主要用于处理辐射伤害的急救包。"
	icon_state = "rad-mini"

/obj/item/storage/kit/small/rad/filled/fill_inventory()
	new /obj/item/container/blood_pack/full/rad_be_gone(src)
	new /obj/item/storage/pillbottle/potassium_iodide_small(src)
	new /obj/item/container/syringe/medipen/dylovene(src)
	new /obj/item/container/simple/alcohol/vodka(src)
	. = ..()


/obj/item/storage/kit/small/advanced
	name = "个人高级急救包"
	desc_extended = "用于处理严重的综合伤势。"
	icon_state = "purple-mini"

/obj/item/storage/kit/small/advanced/filled/fill_inventory()
	new/obj/item/container/healing/trauma_kit/advanced(src)
	new/obj/item/container/healing/burn_kit/advanced(src)
	new/obj/item/storage/pillbottle/dylovene_small(src)
	new/obj/item/storage/pillbottle/iron_small(src)
	. = ..()


/obj/item/storage/kit/small/oxy
	name = "个人缺氧急救包"
	desc_extended = "主要用于处理窒息相关伤害的急救包。"
	icon_state = "oxy-mini"

/obj/item/storage/kit/small/oxy/filled/fill_inventory()
	new /obj/item/container/blood_pack/full/o_negative(src)
	new /obj/item/container/blood_pack/full/o_negative(src)
	new /obj/item/container/syringe/medipen/epinephrine(src)
	new /obj/item/storage/pillbottle/iron_small(src)
	. = ..()

/obj/item/storage/kit/small/syndicate
	name = "战斗高压注射器套装"
	desc_extended = "内含战斗高压注射器，以及装有基础治疗药剂的配套药瓶。"
	icon_state = "tactical-mini"

	size = SIZE_2
	container_max_size = SIZE_2

	container_whitelist = list(
		/obj/item/container/syringe/hypospray/combat,
		/obj/item/container/simple/beaker
	)

/obj/item/storage/kit/small/syndicate/filled/fill_inventory()
	new /obj/item/container/syringe/hypospray/combat(src)
	new /obj/item/container/simple/beaker/bottle/hypospray/brute_mix(src)
	new /obj/item/container/simple/beaker/bottle/hypospray/burn_mix(src)
	new /obj/item/container/simple/beaker/bottle/hypospray/toxin_mix(src)
	. = ..()
