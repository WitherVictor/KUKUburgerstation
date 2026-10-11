/obj/structure/interactive/vending/wizard
	name = "巫师售货机"
	desc = "正版货！"
	icon_state = "MagiVend"
	desc_extended = "一台正版巫师售货机，巫师联邦用它给旗下巫师配发巫师联邦的巫师装备。使用魔法碎片代币作为货币。"

	stored_types = list(
		/obj/item/clothing/overwear/armor/knight/battlemage,
		/obj/item/clothing/head/helmet/full/knight/battlemage,
		/obj/item/soulgem/uncommon,
		/obj/item/container/simple/beaker/bottle/health_potion,
		/obj/item/container/simple/beaker/bottle/stamina_potion,
		/obj/item/container/simple/beaker/bottle/mana_potion,
		/obj/item/weapon/ranged/spellgem/arcblades,
		/obj/item/weapon/ranged/spellgem/blackflame,
		/obj/item/weapon/ranged/spellgem/crystal,
		/obj/item/weapon/ranged/spellgem/fireball,
		/obj/item/weapon/ranged/spellgem/oozey,
		/obj/item/weapon/ranged/spellgem/fireball,
		/obj/item/weapon/ranged/wand/crafted{sockets=3},
		/obj/item/weapon/melee/torch/lantern,
		/obj/item/weapon/ranged/magic/spellblade/runesword,
		/obj/item/weapon/melee/shield/heartstone,
		/obj/item/ability_learner/fireball,
		/obj/item/ability_learner/mana_armor,
		/obj/item/ability_learner/radial_blind,
		/obj/item/ability_learner/smite,
		/obj/item/ability_learner/soul_trap,
		/obj/item/ability_learner/tesla,
		/obj/item/ability_learner/wrath,
		/obj/item/soulgem/common,
		/obj/item/soulgem/uncommon,
		/obj/item/soulgem/rare
	)

	accepts_item = /obj/item/currency/magic_token
	health = null

/obj/structure/interactive/vending/wizard/prank
	name = "魔法恶作剧售货机"
	desc = "……我们发誓，这些只是恶作剧，绝不是谋杀。"
	desc_extended = "一台装着全银河最恶劣的恶作剧道具和玩具的售货机。"
	icon_state = "games"

	stored_types = list(
		/obj/item/container/simple/can/dr_gibb/explosive,
		/obj/item/clothing/back/storage/satchel/bluespace/prank,
		/obj/item/container/spray/ketchup,
		/obj/item/container/spray/mustard,
		/obj/item/firing_pin/electronic/iff/nanotrasen/nyantrasen,
		/obj/item/weapon/ranged/reagent_sprayer/spray_bottle/lube,
		/obj/item/announcement/wizard,
		/obj/item/bikehorn/magic,
		/obj/item/broom/magic
	)
