/obj/item/paper/recipe
	name = "灾难配方"
	desc = "一张用过的纸。"
	desc_extended = "某种东西的配方，字迹已随着时间而模糊。"
	data = list()
/obj/item/paper/recipe/Generate()
	. = ..()
	var/a1 = "-"
	var/a2 = "-"
	var/a3 = "-"

	var/b1 = "-"
	var/b2 = "-"
	var/b3 = "-"

	var/c1 = "-"
	var/c2 = "-"
	var/c3 = "-"
	var/recipe/stored_recipe
	var/max = SSrecipe.all_recipes.len
	stored_recipe = SSrecipe.all_recipes[rand(1,max)]
	if(!(stored_recipe.secret))
		if(stored_recipe.required_item_grid.len >= 1)
			for(var/i = 1, i <= 9, i++)
				var/tocheck
				switch(i) //This is stupid and bad.
					if(1)
						tocheck = "a1"
					if(2)
						tocheck = "a2"
					if(3)
						tocheck = "a3"
					if(4)
						tocheck = "b1"
					if(5)
						tocheck = "b2"
					if(6)
						tocheck = "b3"
					if(7)
						tocheck = "c1"
					if(8)
						tocheck = "c2"
					if(9)
						tocheck = "c3"
				var/recipe_item_text = stored_recipe.required_item_grid[tocheck]
				if(recipe_item_text == null)
					continue
				var/obj/item/recipe_item = text2path_safe(recipe_item_text)
				var/recipe_item_name = initial(recipe_item.name) //I hate this. But it's the only way to get a name from a path...
				switch(i) //This is SO stupid and bad.
					if(1)
						a1 = recipe_item_name
					if(2)
						a2 = recipe_item_name
					if(3)
						a3 = recipe_item_name
					if(4)
						b1 = recipe_item_name
					if(5)
						b2 = recipe_item_name
					if(6)
						b3 = recipe_item_name
					if(7)
						c1 = recipe_item_name
					if(8)
						c2 = recipe_item_name
					if(9)
						c3 = recipe_item_name
			data += list("上排：[a1]、[a2]、[a3]。\n\n","中排：[b1]、[b2]、[b3]。\n\n","下排：[c1]、[c2]、[c3]。\n\n")
		if(stored_recipe.required_items.len >= 1)
			for(var/any_item in stored_recipe.required_items)
				var/obj/item/item_path = text2path_safe(any_item)
				var/item_name = initial(item_path.name)
				data += list("任意位置：[item_name] × [stored_recipe.required_items[any_item]]\n\n")
		if(stored_recipe.required_item_grid_amount.len >= 1)
			for(var/unconsumed in stored_recipe.required_item_grid_amount)
				var/obj/item/item_path = text2path_safe(unconsumed)
				var/item_name = initial(item_path.name)
				if(stored_recipe.required_item_grid_amount[unconsumed] >=1)
					data += list("数量：[item_name] → [stored_recipe.required_item_grid_amount[unconsumed]]\n\n")
				else
					data += list("不消耗：[item_name]")
		if(stored_recipe.reagents_to_add.len >= 1)
			for(var/reagent_path in stored_recipe.reagents_to_add)
				var/reagent/reagent = text2path_safe(reagent_path)
				data += list("产出试剂：[initial(reagent.name)] × [stored_recipe.reagents_to_add[reagent_path]]\n\n")
		if(length(stored_recipe.product) == 1)
			var/product_path = stored_recipe.product[1]
			var/product_name = initial(text2path_safe(product_path).name)
			var/product_chance = stored_recipe.product[product_path]
			name = "[product_name]配方"
			desc = "似乎是某种配方？"
			var/list/recipe_type_labels = list("alchemy" = "炼金台", "bullet_press" = "弹药压制机", "filter" = "过滤器", "smelter" = "熔炉", "workbench" = "工作台")
			var/recipe_type_label = recipe_type_labels[stored_recipe.recipe_type] ? recipe_type_labels[stored_recipe.recipe_type] : deunderscore(stored_recipe.recipe_type)
			desc_extended = "看起来是制作[product_name]的配方，虽然不知道那是什么。在[recipe_type_label]中制作，有[product_chance]%的概率产出[stored_recipe.amount[1]]个。"
		else
			for(var/i = 1,i <= length(stored_recipe.product),i++)
				var/product_path = stored_recipe.product[i]
				var/product_name = initial(text2path_safe(product_path).name)
				var/product_chance = stored_recipe.product[product_path]
				name = "多种物品配方"
				desc = "能做出来的东西还真不少。"
				desc_extended += "看起来有[product_chance]%的概率产出[stored_recipe.amount[i]]个[product_name]。"
	else
		data = list("上面只有涂鸦和无法辨认的字迹。")

/obj/item/paper/recipe/save_item_data(mob/living/advanced/player/P, save_inventory, died)
	//This has a special description, we need to save it!
	. = ..()
	SAVEVAR("data")
	SAVEVAR("desc")
	SAVEVAR("desc_extended")


/obj/item/paper/recipe/load_item_data_post(mob/living/advanced/player/P, list/object_data)
	. = ..()
	LOADVAR("data")
	LOADVAR("desc")
	LOADVAR("desc_extended")
