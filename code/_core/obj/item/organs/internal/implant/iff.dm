// var/global/list/obj/item/organ/internal/implant/hand/left/iff/all_IFFs = list() //For future use in tracking.

/obj/item/organ/internal/implant/hand/left/iff
	name = "\improper 纳米传讯敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止数据库中登记的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	var/registered_name = "none"
	var/registered_id = "none"
	var/registered_squad = "none"
	var/iff_tag = "none"

	value = 0

/obj/item/organ/internal/implant/hand/left/iff/on_organ_add(var/mob/living/advanced/new_owner)
	new_owner.set_iff_tag(iff_tag)
	return ..()

/obj/item/organ/internal/implant/hand/left/iff/on_organ_remove(var/mob/living/advanced/old_owner)
	old_owner.set_iff_tag(initial(old_owner.iff_tag))
	return ..()

/obj/item/organ/internal/implant/hand/left/iff/nanotrasen
	name = "\improper 纳米传讯敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止纳米传讯枪械数据库中登记的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	iff_tag = "NanoTrasen"

/obj/item/organ/internal/implant/hand/left/iff/syndicate
	name = "\improper 辛迪加敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止登记在辛迪加特工名下的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	iff_tag = "Syndicate"

/obj/item/organ/internal/implant/hand/left/iff/revolutionary
	name = "\improper 革命军敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止登记在革命军名下的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	iff_tag = "Revolutionary"


/obj/item/organ/internal/implant/hand/left/iff/deathsquad
	name = "\improper 敢死队敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止登记在敢死队名下的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	iff_tag = "Deathsquad"

/obj/item/organ/internal/implant/hand/left/iff/space_cop
	name = "\improper 太空警察敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止纳米传讯枪械数据库中登记的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	iff_tag = "Space Cop"

/obj/item/organ/internal/implant/hand/left/iff/cult
	name = "\improper 教团敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止纳米传讯枪械数据库中登记的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	iff_tag = "Cult"

/obj/item/organ/internal/implant/hand/left/iff/clockwork_cult
	name = "\improper 发条教团敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止纳米传讯枪械数据库中登记的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	iff_tag = "Clockwork"

/obj/item/organ/internal/implant/hand/left/iff/goblin
	name = "\improper 地精敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止纳米传讯枪械数据库中登记的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	iff_tag = "Goblin"

/obj/item/organ/internal/implant/hand/left/iff/merc
	name = "\improper 雇佣兵敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止纳米传讯枪械数据库中登记的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	iff_tag = "Mercenary"

/obj/item/organ/internal/implant/hand/left/iff/golem
	name = "\improper 魔像敌我识别植入体"
	desc = "防止友军误伤，并收集你的个人信息。"
	desc_extended = "基于民用型号设计的特殊集成敌我识别植入体，可防止纳米传讯枪械数据库中登记的武器瞄准使用者。与民用型号一样，它也会追踪使用者的移动，并向附近设备发送生命体征数据。出于宗教方面的考虑，只能植入左手。"
	iff_tag = "golem"
