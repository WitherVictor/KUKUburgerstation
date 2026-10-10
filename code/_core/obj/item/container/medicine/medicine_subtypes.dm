/obj/item/container/healing/bandage
	name = "绷带"
	desc = "止住出血，就能阻止死亡——至少能拖延一下。"
	desc_extended = "这里的人相信，任何病痛都能用绷带裹好，任何足够柔软的布都能当绷带。真让人纳闷，掌握如此先进医学知识的人怎么还会生病。"
	icon_state = "brutepack"
	treatment_time_mul = 1
	heal_brute = 50
	heal_brute_percent = 0
	heal_bleeding = TRUE
	amount_max = 10
	reagent_max_per_amount = 10

	value = 30

	treatment_sound = 'sound/items/consumables/rip1.ogg'

/obj/item/container/healing/bandage/Generate()
	. = ..()
	amount = 3

/obj/item/container/healing/bandage/advanced
	name = "浸药绷带（止血粉）"
	desc = "比普通布料更能促进伤口恢复。"
	desc_extended = "添加了止血粉的绷带。紧贴皮肤按压时，能比普通绷带更快地闭合伤口。"

	rarity = RARITY_UNCOMMON

/obj/item/container/healing/bandage/advanced/Generate()
	. = ..()
	reagents.add_reagent(/reagent/medicine/styptic_powder, reagents.volume_max)

/obj/item/container/healing/ointment
	name = "药膏"
	desc = "没有什么比给发痒的烧伤处涂上药膏更舒服了。"
	desc_extended = "涂抹在烧伤处，促进皮肤愈合并缓解疼痛。标准药膏曾含有磺胺嘧啶银，但因大批采购太贵而被取消了。"
	icon_state = "ointment"
	treatment_time_mul = 1
	heal_burn = 50
	heal_burn_percent = 0
	value = 30

/obj/item/container/healing/ointment/Generate()
	. = ..()
	amount = 3

/obj/item/container/healing/ointment/advanced
	name = "混药药膏（磺胺嘧啶银）"
	desc = "有时你得自己配药。"
	desc_extended = "混入磺胺嘧啶银的凝胶药膏，在治疗烧伤皮肤和缓解疼痛方面都有效得多。"

	rarity = RARITY_UNCOMMON


/obj/item/container/healing/ointment/advanced/Generate()
	. = ..()
	reagents.add_reagent(/reagent/medicine/silver_sulfadiazine, reagents.volume_max)

/obj/item/container/healing/trauma_kit
	name = "创伤处理包"
	desc = "每包含有一套包扎用品：绷带、夹板和消毒剂。"
	desc_extended = "有助于创伤后的恢复，可用于止血、消毒伤口，以及支撑受伤关节和受损组织。"
	icon_state = "traumakit"
	treatment_time_mul = 1.25
	heal_brute = 80
	heal_brute_percent = 10
	heal_bleeding = TRUE
	amount_max = 10

	value = 80

	rarity = RARITY_UNCOMMON

	treatment_sound = 'sound/items/consumables/tape.ogg'

/obj/item/container/healing/trauma_kit/Generate()
	. = ..()
	amount = 3

/obj/item/container/healing/trauma_kit/advanced
	name = "浸药创伤处理包（止血粉）"
	desc = "我就知道少了点什么。"
	desc_extended = "在绷带和消毒剂中加入止血粉的创伤处理包，能让伤势恢复得更好。"

	value = 100

	rarity = RARITY_RARE

/obj/item/container/healing/trauma_kit/advanced/Generate()
	. = ..()
	reagents.add_reagent(/reagent/medicine/styptic_powder, reagents.volume_max)

/obj/item/container/healing/nanopaste
	name = "纳米修复膏"
	desc = "纳米机械，小子！"
	desc_extended = "一管用于修复的纳米机械，可修复机械肢体受到的物理和灼烧伤害。"
	icon_state = "nanopaste"
	treatment_time_mul = 2
	heal_brute = 80
	heal_brute_percent = 10
	heal_burn = 80
	heal_burn_percent = 10
	heal_bleeding = TRUE
	amount_max = 4
	icon_state_max = 4

	value = 150

	organic = FALSE

	rarity = RARITY_UNCOMMON

/obj/item/container/healing/nanopaste/Generate()
	. = ..()
	amount = 3

/obj/item/container/healing/nanopaste/treat(var/mob/activator,var/atom/A)

	. = ..()

	if(. && is_organ(A))
		var/obj/item/organ/O = A
		if(O.health.organic == organic && O.broken)
			O.broken = FALSE

/obj/item/container/healing/bone_gel
	name = "接骨凝胶"
	desc = "哎哟，我的骨头。"
	desc_extended = "一种先进凝胶，涂抹后能立即促进断骨生长，副作用是造成一些组织损伤。"
	icon_state = "bone_gel"
	treatment_time_mul = 4
	heal_brute = 0
	heal_brute_percent = 0
	amount_max = 3

	value = 100

	organic = TRUE

	rarity = RARITY_UNCOMMON

	treatment_sound = 'sound/items/consumables/ointment.ogg'

/obj/item/container/healing/bone_gel/Generate()
	. = ..()
	amount = 3

/obj/item/container/healing/bone_gel/get_base_value()
	return value

/obj/item/container/healing/bone_gel/treat(var/mob/activator,var/atom/A)

	. = ..()

	if(. && is_organ(A))
		var/obj/item/organ/O = A
		if(O.health.organic == organic && O.broken)
			O.broken = FALSE


/obj/item/container/healing/burn_kit
	name = "烧伤处理包"
	desc = "每包含有一套药膏和消毒剂。"
	desc_extended = "烧伤的大麻烦往往是感染。这些处理包含有消毒剂，可以减少感染。当然，避免感染最好的办法还是死掉。"
	icon_state = "burnkit"
	treatment_time_mul = 1.25
	heal_burn = 80
	heal_burn_percent = 10
	amount_max = 10

	value = 80

	rarity = RARITY_UNCOMMON

	treatment_sound = 'sound/items/consumables/tape.ogg'

/obj/item/container/healing/burn_kit/Generate()
	. = ..()
	amount = 3

/obj/item/container/healing/burn_kit/advanced
	name = "浸药烧伤处理包（磺胺嘧啶银）"
	desc = "真不敢相信，他们居然连磺胺嘧啶银都要省。"
	desc_extended = "用品中加入了磺胺嘧啶银的烧伤处理包。生动地教会你：资本主义永远满足不了你的需求。"

	value = 100

	rarity = RARITY_RARE

/obj/item/container/healing/burn_kit/advanced/Generate()
	. = ..()
	reagents.add_reagent(/reagent/medicine/silver_sulfadiazine, reagents.volume_max)

/obj/item/container/healing/cable
	name = "电缆"
	desc = "比起有线，我更喜欢卫星。"
	desc_extended = "用于修理机械肢体的电缆，可以替换义肢中烧毁的线路。"
	icon_state = "cable"
	treatment_time_mul = 1.25
	heal_burn = 70
	amount_max = 10

	value = 20

	organic = FALSE

	reagents = null

/obj/item/container/healing/cable/Generate()
	. = ..()
	amount = 5

/obj/item/container/healing/patch
	name = "医用贴片"
	desc = "懒得用注射器时的选择。"
	desc_extended = "这种贴片本身不能包扎伤口，但能迅速给予大量药物。当然，用药过量可能加速死亡，所以要小心。"
	icon_state = "patch"
	treatment_time_mul = 0.5
	amount_max = 3

	value = 5

	rarity = RARITY_UNCOMMON

/obj/item/container/healing/patch/brute
	name = "外伤贴片（止血粉）"
	desc = "懒得用注射器时的选择。"
	desc_extended = "这种贴片本身不能包扎伤口，但能迅速给予大量药物。当然，用药过量可能加速死亡，所以要小心。"
	icon_state = "patch_brute"

/obj/item/container/healing/patch/brute/Generate()
	. = ..()
	reagents.add_reagent(/reagent/medicine/styptic_powder, reagents.volume_max)

/obj/item/container/healing/patch/burn
	name = "烧伤贴片（磺胺嘧啶银）"
	desc = "懒得用注射器时的选择。"
	desc_extended = "这种贴片本身不能包扎伤口，但能迅速给予大量药物。当然，用药过量可能加速死亡，所以要小心。"
	icon_state = "patch_burn"

/obj/item/container/healing/patch/burn/Generate()
	. = ..()
	reagents.add_reagent(/reagent/medicine/silver_sulfadiazine, reagents.volume_max)

/obj/item/container/healing/patch/synthflesh
	name = "再生贴片（合成血肉）"
	desc = "懒得用注射器时的选择。"
	desc_extended = "这种贴片本身不能包扎伤口，但能迅速给予大量药物。当然，用药过量可能加速死亡，所以要小心。"
	icon_state = "patch"

/obj/item/container/healing/patch/synthflesh/Generate()
	. = ..()
	reagents.add_reagent(/reagent/medicine/synthflesh, reagents.volume_max)

/obj/item/container/healing/gauze
	name = "纱布"
	desc = "止血。仅此而已。"
	desc_extended = "这里的人相信，任何病痛都能用绷带裹好，任何足够柔软的布都能当绷带。真让人纳闷，掌握如此先进医学知识的人怎么还会生病。"
	icon_state = "gauze"
	treatment_time_mul = 1
	heal_brute = 0
	heal_brute_percent = 0
	heal_bleeding = TRUE
	amount_max = 10

	value = 10

	treatment_sound = 'sound/items/consumables/tape.ogg'

/obj/item/container/healing/gauze/Generate()
	. = ..()
	amount = 5
