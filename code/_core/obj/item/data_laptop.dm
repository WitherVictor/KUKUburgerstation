

//5 to 10 random syndicate vaults are placed on the map.
//The laptop can give you access to it by giving you the coords of the vault as well as the keyphrase.


/obj/item/data_laptop
	name = "机密数据笔记本电脑"
	desc = "绝密！"
	desc_extended = "存有秘密仓库位置机密数据的笔记本电脑。打开后会显示坐标和密码，随后清空全部数据！"

	icon = 'icons/obj/item/data_laptop.dmi'
	icon_state = "closed"

	var/used = FALSE

	rarity = RARITY_RARE

	value = 5000

/obj/item/data_laptop/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("used")

/obj/item/data_laptop/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("used")

/obj/item/data_laptop/get_base_value()
	. = ..()
	. *= used ? 0.01 : 1
	. = CEILING(.,1)

/obj/item/data_laptop/update_icon()

	. = ..()

	icon_state = initial(icon_state)

	if(used)
		icon_state = "useless"

/obj/item/data_laptop/Finalize()
	. = ..()
	update_sprite()

/obj/item/data_laptop/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(10)

	if(used)
		activator.to_chat(span("warning","什么也没发生……"))
		update_sprite()
		return TRUE

	var/obj/structure/interactive/door/vault/syndicate/D
	while(TRUE)
		if(!length(SSobj.all_vault_doors))
			activator.to_chat(span("notice","[src.name]似乎不肯开机……也许换个班次再用？"))
			return TRUE
		D = pick(SSobj.all_vault_doors)
		SSobj.all_vault_doors -= D
		if(!D.z || !D.stored_keypad || !D.stored_keypad.code)
			continue //Bad one.
		break //Found a good one.

	used = TRUE
	update_sprite()
	flick("open",src)

	value = get_base_value()

	activator.to_chat(span("notice","[src.name]闪现出坐标\"<b>[D.x],[D.y],[D.z]</b>\"和密码\"<b>[D.stored_keypad.code]</b>\"，随后闪烁着黑了屏……"))

	return TRUE
