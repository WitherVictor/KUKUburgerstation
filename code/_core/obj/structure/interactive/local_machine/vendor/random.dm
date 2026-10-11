/obj/structure/interactive/vending/random
	name = "神秘售货机"
	desc = "这些商品可真够奇怪的……"
	desc_extended = "一台古旧却保存得出奇完好的售货机，里面装着……什么？"
	icon_state = "sustenance"

	stored_types = list()

	ignore_economy = TRUE

	accepts_item = /obj/item/currency/dosh

	health = null

/obj/structure/interactive/vending/random/Finalize()

	markup = rand(2,4)

	for(var/i=1,i<=rand(3,6),i++)
		switch(rand(1,3))
			if(1)
				SPAWN_LOOT(/loot/random/trash,src.loc)
			if(2)
				SPAWN_LOOT(/loot/random/low,src.loc)
			if(3)
				SPAWN_LOOT(/loot/random/medium,src.loc)

	return ..()
