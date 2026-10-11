

/event/economy_dump
	name = "Economy Dump"

	probability = 1 //relative

	occurances_max = 0 //Disabled.



/event/economy_dump/on_start()

	log_debug("Starting Economy Dump Event")

	var/price_increase = rand(5,25) //Percent.

	announce(
		"中央指挥部经济事务处",
		"经济崩溃",
		"中央指挥部经济事务处遗憾地通知各位，市场已发生经济崩溃。所有物品价格上涨[price_increase]%。",
		sound_to_play = 'sound/round_end/dump_it.ogg'
	)

	SSeconomy.crash_buy_multiplier += (price_increase/100)

	return ..()

/event/economy_dump/on_end()
	log_debug("Ending Economy Dump Event")
	return ..()
