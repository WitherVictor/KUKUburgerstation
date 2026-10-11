/obj/item/container/simple/chemistry
	desc = "今天我们来搞点酷炫的科学。制药科学！"
	desc_extended = "试剂容器，里面多半装着用于化学实验的化学品。"
	icon = 'icons/obj/item/container/chemistry.dmi'
	icon_state = null
	reagents = /reagent_container/beaker/bottle/large
	size = SIZE_3

	var/reagent/reagent_to_add

/obj/item/container/simple/chemistry/Generate()
	. = ..()
	if(reagents && reagent_to_add)
		reagents.add_reagent(reagent_to_add,reagents.volume_max)

/obj/item/container/simple/chemistry/ammonia
	name = "液氨壶"
	icon_state = "ammonia"
	reagent_to_add = /reagent/ammonia
	value = 1

/obj/item/container/simple/chemistry/sodium_chloride
	name = "氯化钠瓶"
	icon_state = "sodium_chloride"
	reagents = /reagent_container/beaker/bottle
	reagent_to_add = /reagent/salt/sodium_chloride
	value = 1

/obj/item/container/simple/chemistry/sulfur
	name = "硫瓶"
	icon_state = "sulfur"
	reagents = /reagent_container/beaker/bottle
	reagent_to_add = /reagent/sulfur
	value = 1

/obj/item/container/simple/chemistry/silicon
	name = "硅瓶"
	icon_state = "silicon"
	reagents = /reagent_container/beaker/bottle
	reagent_to_add = /reagent/silicon
	value = 1

/obj/item/container/simple/chemistry/acetone
	name = "丙酮壶"
	icon_state = "acetone"
	reagent_to_add = /reagent/fuel/acetone
	value = 1

/obj/item/container/simple/chemistry/phenol
	name = "苯酚壶"
	icon_state = "phenol"
	reagent_to_add = /reagent/phenol
	value = 1
