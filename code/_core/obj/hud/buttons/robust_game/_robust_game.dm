/obj/hud/button/robust/
	flags = FLAGS_HUD_SPECIAL
	has_quick_function = FALSE
	maptext_width = TILE_SIZE
	maptext_height = TILE_SIZE

/obj/hud/button/robust/piece/
	var/obj/hud/button/robust/board/linked_board

/obj/hud/button/robust/piece/Destroy()
	if(linked_board)
		linked_board.linked_pieces -= src
		linked_board = null


/obj/hud/button/robust/piece/attack
	name = "攻击"
	maptext = "<center>攻击</center>"

/obj/hud/button/robust/piece/regen
	name = "再生"
	maptext = "<center>再生</center>"

/obj/hud/button/robust/piece/heal
	name = "治疗"
	maptext = "<center>治疗</center>"


/obj/hud/button/robust/piece/player_stats
	name = "你的状态"

/obj/hud/button/robust/piece/antag_stats
	name = "敌人状态"

/obj/hud/button/robust/board

	var/list/linked_pieces = list()

	var/obj/hud/button/robust/player_stats/linked_player_stats
	var/obj/hud/button/robust/antag_stats/linked_antag_stats
