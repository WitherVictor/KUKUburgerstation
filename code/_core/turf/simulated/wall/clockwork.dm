/turf/simulated/wall/clockwork
	name = "发条墙"
	desc = "滴答滴答，混蛋。"
	desc_extended = "一堵黄铜墙，里面传来微弱的滴答声。"
	icon = 'icons/turf/wall/clockwork.dmi'
	icon_state = "wall"
	corner_category = "clockwork"
	corner_icons = TRUE

	destruction_turf = /turf/simulated/floor/plating

	health_base = 1500

	map_color = "#704326"

/turf/simulated/wall/clockwork/indestructable
	name = "不可摧毁的发条墙"
	desc = "滴答滴答，混蛋。"
	desc_extended = "一堵黄铜墙，里面传来微弱的滴答声。它获得了拉特瓦尔的力量，因此不可摧毁。"
	destruction_turf = null
	color = "#C0C0C0"

/turf/simulated/wall/clockwork/tough
	name = "炽热发条墙"
	desc = "真烫。"
	desc_extended = "一堵黄铜墙，里面传来微弱的滴答声。它似乎经过加热，更加坚固。"
	color = "#FFC9C9"


	destruction_turf = /turf/simulated/floor/plating

	health_base = 2000
