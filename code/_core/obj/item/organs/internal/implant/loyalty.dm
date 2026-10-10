/obj/item/organ/internal/implant/head/loyalty
	var/registered_name = "none"
	var/registered_id = "none"
	var/registered_squad = "none"
	var/loyalty_tag = "none"

	value = 0

/obj/item/organ/internal/implant/head/loyalty/on_organ_add(var/mob/living/advanced/new_owner)
	new_owner.set_loyalty_tag(loyalty_tag)
	return ..()

/obj/item/organ/internal/implant/head/loyalty/on_organ_remove(var/mob/living/advanced/old_owner)
	old_owner.set_loyalty_tag(initial(old_owner.loyalty_tag))
	return ..()

/obj/item/organ/internal/implant/head/loyalty/nanotrasen
	name = "\improper 忠诚植入体"
	desc = "你愿意宣誓效忠吗？不愿意？好吧，反正也不重要。"
	desc_extended = "最先进的纳米传讯忠诚植入追踪器，时髦的年轻人都叫它 NT-LIT。此植入体能阻止使用者对植入同型号设备的人造成大多数形式的直接身体伤害，反之亦然。注意，目前的技术还无法阻止其他来源的伤害，但纳米传讯不想让你知道这一点。"
	loyalty_tag = "NanoTrasen"

/obj/item/organ/internal/implant/head/loyalty/syndicate
	name = "\improper 自由植入体"
	desc = "给你带来<b>自由</b>的植入体。"
	desc_extended = "高度违禁的辛迪加自由植入体，专门用于覆盖并替换其他纳米传讯忠诚植入体。它能阻止使用者伤害植入同型号自由植入体的人，反之亦然。"
	loyalty_tag = "Syndicate"

/obj/item/organ/internal/implant/head/loyalty/revolutionary
	name = "\improper 革命植入体"
	desc = "给你带来<b>共产主义</b>的植入体。"
	desc_extended = "高度违禁的革命植入体，专门用于覆盖并替换其他纳米传讯忠诚植入体。它能阻止使用者伤害植入同型号设备的人，反之亦然。"
	loyalty_tag = "Revolutionary"

/obj/item/organ/internal/implant/head/loyalty/deathsquad
	name = "\improper 敢死队植入体"
	desc = "你愿意宣誓效忠吗？不愿意？好吧，反正也不重要。"
	desc_extended = "最先进的纳米传讯忠诚植入追踪器敢死队版，时髦的年轻人都叫它 NT-LIT-D。此植入体能阻止使用者对植入同型号设备的人造成大多数形式的直接身体伤害，反之亦然。注意，目前的技术还无法阻止其他来源的伤害，但纳米传讯不想让你知道这一点。"
	loyalty_tag = "Deathsquad"

/obj/item/organ/internal/implant/head/loyalty/space_cop
	name = "\improper 太空警察植入体"
	desc = "你愿意宣誓效忠吗？不愿意？好吧，反正也不重要。"
	desc_extended = "最先进的纳米传讯忠诚植入追踪器，时髦的年轻人都叫它 NT-LIT。此植入体能阻止使用者对植入同型号设备的人造成大多数形式的直接身体伤害，反之亦然。注意，目前的技术还无法阻止其他来源的伤害，但纳米传讯不想让你知道这一点。"
	loyalty_tag = "Space Cop"

/obj/item/organ/internal/implant/head/loyalty/cult
	name = "\improper 教团植入体"
	desc = "你愿意宣誓效忠吗？不愿意？好吧，反正也不重要。"
	desc_extended = "最先进的纳米传讯忠诚植入追踪器，时髦的年轻人都叫它 NT-LIT。此植入体能阻止使用者对植入同型号设备的人造成大多数形式的直接身体伤害，反之亦然。注意，目前的技术还无法阻止其他来源的伤害，但纳米传讯不想让你知道这一点。"
	loyalty_tag = "Cult"

/obj/item/organ/internal/implant/head/loyalty/clockwork_cult
	name = "\improper 发条教团植入体"
	desc = "你愿意宣誓效忠吗？不愿意？好吧，反正也不重要。"
	desc_extended = "最先进的纳米传讯忠诚植入追踪器，时髦的年轻人都叫它 NT-LIT。此植入体能阻止使用者对植入同型号设备的人造成大多数形式的直接身体伤害，反之亦然。注意，目前的技术还无法阻止其他来源的伤害，但纳米传讯不想让你知道这一点。"
	loyalty_tag = "Clockwork"

/obj/item/organ/internal/implant/head/loyalty/goblin
	name = "\improper 地精植入体"
	desc = "你愿意宣誓效忠吗？不愿意？好吧，反正也不重要。"
	desc_extended = "最先进的纳米传讯忠诚植入追踪器，时髦的年轻人都叫它 NT-LIT。此植入体能阻止使用者对植入同型号设备的人造成大多数形式的直接身体伤害，反之亦然。注意，目前的技术还无法阻止其他来源的伤害，但纳米传讯不想让你知道这一点。"
	loyalty_tag = "Goblin"

/obj/item/organ/internal/implant/head/loyalty/merc
	name = "\improper 雇佣兵植入体"
	desc = "你愿意宣誓效忠吗？不愿意？好吧，反正也不重要。"
	desc_extended = "最先进的纳米传讯忠诚植入追踪器，时髦的年轻人都叫它 NT-LIT。此植入体能阻止使用者对植入同型号设备的人造成大多数形式的直接身体伤害，反之亦然。注意，目前的技术还无法阻止其他来源的伤害，但纳米传讯不想让你知道这一点。"
	loyalty_tag = "Mercenary"

/obj/item/organ/internal/implant/head/loyalty/golem
	name = "\improper 魔像植入体"
	desc = "你现在得去挖石头了，废物！！1！1！"
	desc_extended = "最先进的纳米传讯忠诚植入追踪器，时髦的年轻人都叫它 NT-LIT。此植入体能阻止使用者对植入同型号设备的人造成大多数形式的直接身体伤害，反之亦然。注意，目前的技术还无法阻止其他来源的伤害，但纳米传讯不想让你知道这一点。"
	loyalty_tag = "golem"
/*
/obj/item/organ/internal/implant/head/loyalty/wizard_federation
	name = "\improper Wizard Federation implant"
	desc = "Do you swear loyalty? No? Well that doesn't matter."
	desc_extended = "A state of the art NanoTrasen Loyalty Implant Tracker, or NT-LIT, as the cool kids call it. This implant prevents the user from doing most forms of physical harm to those who also have the same loyalty implant model, and vice versa. Note that technology isn't advanced enough to stop other sources of harm, but NanoTrasen doesn't want you to know about that."
	loyalty_tag = "Wizard Federation"
*/
