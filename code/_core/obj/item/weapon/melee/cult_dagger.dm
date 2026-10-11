/obj/item/weapon/melee/sword/cult_dagger
	name = "邪教徒匕首"
	desc = "如今安全可靠，放心使用！"
	desc_extended = "巫师联邦改造的古老邪教徒匕首，用于灵魂捕获。有时也能在邪教徒手中看到它，颇有几分讽刺意味。"
	icon = 'icons/obj/item/weapons/melee/swords/cult_dagger.dmi'
	icon_state = "inventory"
	dan_mode = FALSE

	value = 1

	damage_type = /damagetype/melee/sword/cult_dagger
	size = SIZE_2
	weight = 7
	rarity = RARITY_UNCOMMON

/obj/item/weapon/melee/sword/cult_dagger/Generate()
	. = ..()
	enchantment = new /enchantment/soul_trap
	enchantment.strength = 5
	enchantment.cost = initial(enchantment.cost) * enchantment.strength * 0.75
	enchantment.charge = SOUL_SIZE_UNCOMMON
	enchantment.max_charge = SOUL_SIZE_UNCOMMON
