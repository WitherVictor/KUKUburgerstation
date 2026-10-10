/obj/item/paper/book/cargo_catalog/
	name = "参考书：货运目录第一卷"
	desc = "牙膏大甩卖？终于等到了！！！"
	icon_state = "book3"
	desc_extended = "收录货运部可购物品的目录。"


/obj/item/paper/book/cargo_catalog/Initialize()
	. = ..()
	data = SScargo.catalog_data.Copy()

/obj/item/paper/book/chemistry/
	name = "参考书：化学"
	desc = "赢家不吸毒！冰毒除外。"
	icon_state = "chemistrybook"
	desc_extended = "收录人类已知全部药物配方的目录。"

/obj/item/paper/book/chemistry/Initialize()
	. = ..()
	data = SSreagent.stored_book_data["Chemistry"].Copy()

/*
/obj/item/paper/book/cookingchem/Initialize()
	. = ..()
	name = "reference: Cooking Recipes"
	desc = "I am the one who cooks burgers."
	desc_extended = "A catalog featuring all the cooking recipes known to man."
	icon_state = "chefbook"
	data =

/obj/item/paper/book/bartending/Initialize()
	. = ..()
	name = "reference: Mixing Drinks"
	desc = "Drinks are on you from now on"
	icon_state = "barbook"
	desc_extended = "A catalog featuring all the drink recipes known to man."
	data =
*/

//I am not touching book code, someone please add these.
