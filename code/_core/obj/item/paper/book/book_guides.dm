/obj/item/paper/book/firearms/
	name = "手册：枪械指南"
	desc = "火力还不够。"
	icon_state = "bookSpaceLaw"
	desc_extended = "介绍现代枪械使用与保养方法的指南。"

/obj/item/paper/book/firearms/Initialize()
	. = ..()
	data = SSpaper.all_paper_data["a guide to firearms"].Copy()

/obj/item/paper/book/cooking/
	name = "手册：烹饪指南"
	desc = "她把我给煮了。"
	icon_state = "cooked_book"
	desc_extended = "教你如何烹饪的指南，希望不会让你烧掉厨房或召唤出恶魔。"

/obj/item/paper/book/cooking/Initialize()
	. = ..()
	data = SSpaper.all_paper_data["a guide to cooking"].Copy()


/obj/item/paper/book/fishing/
	name = "手册：钓鱼指南"
	desc = "享受生活的方法。"
	icon_state = "hydrobucket"
	desc_extended = "教你钓鱼的指南。酷毙了！"

/obj/item/paper/book/fishing/Initialize()
	. = ..()
	data = SSpaper.all_paper_data["a guide to fishing"].Copy()

/obj/item/paper/book/ghost/
	name = "手册：捉鬼指南"
	desc = "如何避免死在幽灵手里。"
	icon_state = "bookDetective"
	desc_extended = "指导你成功捉鬼的参考手册。"

/obj/item/paper/book/ghost/Initialize()
	. = ..()
	data = SSpaper.all_paper_data["ghosthunting guide"].Copy()

/obj/item/paper/book/controls/
	name = "手册：控制自己指南"
	desc = "我该怎么换手？"
	icon_state = "book2"
	desc_extended = "教你掌握自我控制的指南。这里的控制就是字面意思：拿在手中使用，即可查看汉堡站的基本操作。"

/obj/item/paper/book/controls/Initialize()
	. = ..()
	data = SSpaper.all_paper_data["a guide to controlling yourself"].Copy()

/obj/item/paper/book/enchanting_guide
	name = "手册：附魔指南"
	desc = "别搞色情角色扮演。"
	icon_state = "tome_old"
	desc_extended = "教你掌握附魔技艺的指南。"


/obj/item/paper/book/enchanting_guide/Initialize()
	. = ..()
	data = SSpaper.all_paper_data["a guide to enchanting"].Copy()

/obj/item/paper/book/crafting_guide/
	name = "手册：制作指南"
	desc = "这跟什么《肉末世界》有啥关系？"
	icon_state = "bookCrafting"
	desc_extended = "收录制作配方的参考手册。"

/obj/item/paper/book/crafting_guide/Initialize()
	. = ..()
	data = SSpaper.all_paper_data["crafting recipes"].Copy()
