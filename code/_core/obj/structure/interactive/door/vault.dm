/obj/structure/interactive/door/vault
	name = "安全金库门"
	desc = "要是有一把钻头就好了。"
	desc_extended = "一扇极其厚重的钢门，配备了人类已知的所有防绕过措施。没有相应权限就别想通过。"
	icon = 'icons/obj/structure/airlock/vault_door.dmi'
	icon_state = "vault"
	color = "#FFFFFF"
	health = null
	locked = TRUE

/obj/structure/interactive/door/vault/syndicate
	icon = 'icons/obj/structure/airlock/vault_door_dark.dmi'
	desc_extended = "一扇极其厚重的钢门，配备了人类已知的所有防绕过措施。没有正确密码就别想通过。"
	var/obj/item/device/keypad/stored_keypad

/obj/structure/interactive/door/vault/syndicate/PreDestroy()
	SSobj.all_vault_doors -= src
	QDEL_NULL(stored_keypad)
	. = ..()

/obj/structure/interactive/door/vault/syndicate/Generate()
	. = ..()
	stored_keypad = new(src)
	stored_keypad.name = "[src.name] [stored_keypad.name]"
	stored_keypad.code = rand(1000,9999)
	stored_keypad.anchored = TRUE
	INITIALIZE(stored_keypad)
	GENERATE(stored_keypad)
	FINALIZE(stored_keypad)

/obj/structure/interactive/door/vault/syndicate/defer_click_on_object(var/mob/activator,location,control,params)

	if(stored_keypad)
		return stored_keypad

	. = ..()

/obj/structure/interactive/door/vault/syndicate/Finalize()
	. = ..()
	SSobj.all_vault_doors += src


/obj/structure/interactive/door/vault/syndicate/trigger(var/mob/activator,var/atom/source,var/signal_freq,var/signal_code)

	if(door_state == DOOR_STATE_BROKEN)
		return FALSE

	if(door_state == DOOR_STATE_CLOSED)
		if(locked)
			unlock(activator)
			open(activator)
		else
			lock(activator)
	else if(door_state == DOOR_STATE_OPENED)
		close(activator,TRUE)

	return TRUE
