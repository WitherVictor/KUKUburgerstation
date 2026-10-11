/obj/item/marker
	name = "记号笔"
	desc = "给物品改名！"
	desc_extended = "近乎神奇的笔，可以给某些物品改名。只能使用一次，请勿滥用。"

	icon = 'icons/obj/item/marker.dmi'
	icon_state = "inventory"

	value = 50
	value_burgerbux = 2

	weight = 0.1

	rarity = RARITY_RARE

/obj/item/marker/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(!is_item(object) || object == src)
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT

	var/obj/item/I = object

	if(!I.can_rename)
		activator.to_chat(span("warning","[I.name]无法改名……"))
		return TRUE

	var/list/confirmation_labels = list("是"="Yes","否"="No","取消"="Cancel")
	var/confrim = input("确定要给[I.name]改名吗？操作完成后记号笔就会耗尽！","记号笔改名","取消") as null|anything in confirmation_labels
	confrim = confirmation_labels[confrim]

	if(confrim != "Yes")
		return TRUE

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT

	activator.to_chat(span("danger","请注意，滥用改名功能会导致封禁。"))

	var/desired_name = input("你想将[I.name]改成什么名字？留空可取消。","物品改名",I.name) as text

	if(!desired_name)
		return TRUE

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT

	desired_name = police_text(activator.client,desired_name,check_name=TRUE,check_characters=TRUE,min_length=2,max_length=40)

	if(!desired_name)
		return TRUE

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT

	activator.visible_message(span("notice","[activator.name]将[I.name]改名为[desired_name]。"),span("notice","你将[I.name]改名为[desired_name]。"))

	log_admin("[activator.get_debug_name()] renamed \"[I.name]\" to \"[desired_name]\".")

	I.name = desired_name

	activator.to_chat(span("warning","[src]已经耗尽了。"))
	qdel(src)

	return TRUE
