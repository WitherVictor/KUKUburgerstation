/obj/item/consumable/food/burger
	name = "汉堡"
	desc = "引人深思。"

	icon = 'icons/obj/items/consumable/food/burgers.dmi'
	icon_state = "hburger"

	heal_amount_health = 0
	heal_amount_stamina = 0
	heal_amount_mana = 0
	uses_left = 4

	consume_verb = "eat"

/obj/item/consumable/food/burger/ham
	name = "汉堡包"
	icon_state = "burger"

	heal_amount_health = 20
	heal_amount_stamina = 10

/obj/item/consumable/food/burger/ham/double
	name = "咬咬汉堡"
	icon_state = "bigbiteburger"
	uses_left = 8

/obj/item/consumable/food/burger/ham/quad
	name = "超级大口汉堡"
	icon_state = "superbiteburger"
	uses_left = 16

/obj/item/consumable/food/burger/bacon
	name = "培根汉堡"
	icon_state = "baconburger"

	heal_amount_health = 30
	heal_amount_stamina = 10

/obj/item/consumable/food/burger/tofu
	name = "豆腐汉堡"
	icon_state = "tofuburger"

	heal_amount_health = 0
	heal_amount_stamina = 40

/obj/item/consumable/food/burger/brain
	name = "脑肉汉堡"
	icon_state = "brainburger"

	heal_amount_health = 20
	heal_amount_stamina = 20
	heal_amount_mana = 100

/obj/item/consumable/food/burger/xeno
	name = "异形汉堡"
	icon_state = "xburger"

	heal_amount_health = 100
	heal_amount_stamina = -100
	heal_amount_mana = -100

/obj/item/consumable/food/burger/jelly
	name = "果冻汉堡"
	icon_state = "jellyburger"

	heal_amount_health = 100
	heal_amount_stamina = 10
	heal_amount_mana = 0

/obj/item/consumable/food/burger/roburger
	name = "机器人汉堡"
	icon_state = "roburger"

	heal_amount_health = 0
	heal_amount_stamina = 100
	heal_amount_mana = 0

/obj/item/consumable/food/burger/spellburger
	name = "法术汉堡"
	icon_state = "spellburger"

	heal_amount_health = 0
	heal_amount_stamina = 10
	heal_amount_mana = 1000

/obj/item/consumable/food/burger/appendix
	name = "阑尾汉堡"
	icon_state = "appendixburger"

	heal_amount_health = 50
	heal_amount_stamina = 10
	heal_amount_mana = 0


/obj/item/consumable/food/burger/fish
	name = "鱼肉汉堡"
	icon_state = "fishburger"

	heal_amount_health = 50
	heal_amount_stamina = 20
	heal_amount_mana = 0

/obj/item/consumable/food/burger/fish/crab
	name = "蟹肉汉堡"

/obj/item/consumable/food/burger/clown
	name = "小丑汉堡"
	icon_state = "clownburger"

	heal_amount_health = 0
	heal_amount_stamina = 0
	heal_amount_mana = 0

/obj/item/consumable/food/burger/clown/New(var/desired_loc)
	..()
	heal_amount_health = rand(-10,10) * 10
	heal_amount_stamina = rand(-10,10) * 10
	heal_amount_mana = rand(-10,10) * 10

/obj/item/consumable/food/burger/mime
	name = "默剧演员汉堡"
	icon_state = "mimeburger"

	heal_amount_health = 20
	heal_amount_stamina = 100
	heal_amount_mana = 20

/obj/item/consumable/food/burger/colored
	name = "彩色汉堡"
	icon_state = "cburger"

	color = "#FFFFFF"

	heal_amount_health = 0
	heal_amount_stamina = 0
	heal_amount_mana = 0

/obj/item/consumable/food/burger/colored/New(var/desired_loc)
	..()
	heal_amount_health = GetRedPart(color)/2.55
	heal_amount_stamina = GetGreenPart(color)/2.55
	heal_amount_mana = GetBluePart(color)/2.55
	var/total_mod = 100/(heal_amount_health + heal_amount_stamina + heal_amount_mana)

	heal_amount_health *= total_mod
	heal_amount_stamina *= total_mod
	heal_amount_mana *= total_mod

/obj/item/consumable/food/burger/bear
	name = "熊肉汉堡"
	icon_state = "bearger"

	heal_amount_health = 100
	heal_amount_stamina = 100
	heal_amount_mana = 0

/obj/item/consumable/food/burger/fivealarm
	name = "五级火警辣堡"
	icon_state = "fivealarmburger"

	heal_amount_health = 0
	heal_amount_stamina = 1000
	heal_amount_mana = 0

/obj/item/consumable/food/burger/ratburger
	name = "鼠肉汉堡"
	icon_state = "ratburger"

	heal_amount_health = 50
	heal_amount_stamina = -25
	heal_amount_mana = -25

/obj/item/consumable/food/burger/baseballburger
	name = "棒球汉堡"
	icon_state = "baseball"

	heal_amount_health = 25
	heal_amount_stamina = 10
	heal_amount_mana = 0
