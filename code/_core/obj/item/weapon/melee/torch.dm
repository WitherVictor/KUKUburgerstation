/obj/item/weapon/melee/torch //Also flashlights.
	name = "火把"
	desc = "穴居人和革命者的必备品。"
	desc_extended = "能够照明。不知为何，燃料永远烧不完。"
	icon = 'icons/obj/item/weapons/melee/clubs/torch.dmi'

	var/enabled = FALSE

	damage_type = /damagetype/melee/club/torch/
	var/damage_type_on = /damagetype/melee/club/torch/on

	override_icon_state = TRUE
	override_icon_state_held = TRUE

	desired_light_range = VIEW_RANGE*0.5
	desired_light_power = 0.7
	desired_light_color = "#FFD175"
	desired_light_angle = LIGHT_OMNI

	size = SIZE_3
	weight = 3

	value = 10

/obj/item/weapon/melee/torch/get_base_value()
	. = ..()
	. += (desired_light_range*desired_light_power*desired_light_angle*0.1)
	. = CEILING(.,1)

/obj/item/weapon/melee/torch/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	enabled = !enabled
	update_sprite()
	update_atom_light()
	return TRUE

/obj/item/weapon/melee/torch/update_atom_light()
	if(enabled)
		set_light_sprite(desired_light_range, desired_light_power, desired_light_color,desired_light_angle)
	else
		set_light_sprite(FALSE)
	return TRUE

/obj/item/weapon/melee/torch/update_icon()

	if(enabled)
		damage_type = damage_type_on
		icon_state = "[initial(icon_state)]_on"
		icon_state_held_left = "[initial(icon_state_held_left)]_on"
		icon_state_held_right = "[initial(icon_state_held_right)]_on"
	else
		damage_type = initial(damage_type)
		icon_state = initial(icon_state)
		icon_state_held_left = initial(icon_state_held_left)
		icon_state_held_right = initial(icon_state_held_right)

	update_held_icon()

	return ..()


/obj/item/weapon/melee/torch/lantern
	name = "提灯"
	desc = "可这是什么提灯？算了，谁在乎呢。"
	desc_extended = "提供明亮的照明。不知为何，燃料永远烧不完。"
	icon = 'icons/obj/item/weapons/melee/clubs/lantern.dmi'

	damage_type = /damagetype/item/medium
	damage_type_on = /damagetype/item/medium

	override_icon_state = TRUE
	override_icon_state_held = TRUE

	desired_light_range = VIEW_RANGE*0.75
	desired_light_power = 0.75
	desired_light_color = "#FFD175"

	value = 100

	size = SIZE_2


/obj/item/weapon/melee/torch/flashlight
	name = "塑料手电筒"
	desc = "没有它可活不下去！"
	desc_extended = "开启后向特定方向和范围投射光线。"
	icon = 'icons/obj/item/weapons/melee/clubs/flashlight.dmi'

	damage_type = /damagetype/item/light
	damage_type_on = /damagetype/item/light

	override_icon_state = TRUE
	override_icon_state_held = TRUE

	desired_light_range = VIEW_RANGE*0.75
	desired_light_power = 0.7
	desired_light_color = "#FFF0C6"
	desired_light_angle = LIGHT_WIDE

	value = 20

	size = SIZE_2

/obj/item/weapon/melee/torch/flashlight/get_examine_list(var/mob/examiner)
	. = ..()
	. += span("notice","手电筒只照向你面朝的方向。<br>按住V可调整角色朝向；选中伤害意图时，朝向会自动调整。")

/obj/item/weapon/melee/torch/flashlight/maglight
	name = "重型手电筒"
	desc = "结实耐用的手电筒。"
	icon = 'icons/obj/item/weapons/melee/clubs/maglight.dmi'

	damage_type = /damagetype/item/medium
	damage_type_on = /damagetype/item/medium

	override_icon_state = TRUE
	override_icon_state_held = TRUE

	desired_light_range = VIEW_RANGE
	desired_light_power = 0.8
	desired_light_color = "#FFF0C6"
	desired_light_angle = LIGHT_NARROW

	value = 80

	size = SIZE_2


/obj/item/weapon/melee/torch/tinea_luxor
	name = "萤蕈素光源"
	desc = "你不该看到这个。"
	desired_light_range = VIEW_RANGE
	desired_light_power = 0.9
	desired_light_color = "#E3FF9E"
	desired_light_angle = LIGHT_OMNI
	value = 0

	enabled = TRUE
