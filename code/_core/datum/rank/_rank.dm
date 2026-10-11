/rank/
	var/name = "Rank Name"
	var/desc = "Rank Description"
	var/id

	var/permissions = FLAG_PERMISSION_NONE
	var/protection = 0 //Higher equals better.
	var/list/verbs = list()

/rank/user/ //Don't need to add this to the config.
	name = "普通玩家"
	id = "USER"
	desc = "The default rank for players. They have no special commands or actions."
	permissions = FLAG_PERMISSION_NONE
	protection = 1

/rank/donator/bronze
	name = "青铜会员"
	id = "BRONZE"
	desc = "A bronze donator."
	permissions = FLAG_PERMISSION_BRONZE
	protection = 2

/rank/donator/silver
	name = "白银会员"
	id = "SILVER"
	desc = "A silver donator."
	permissions = FLAG_PERMISSION_SILVER
	protection = 3

/rank/donator/gold
	name = "黄金会员"
	id = "GOLD"
	desc = "A gold donator."
	permissions = FLAG_PERMISSION_GOLD
	protection = 4

/rank/moderator/
	name = "版务管理员"
	id = "MOD"
	desc = "Moderators can moderate with commands such as kick, ban, and mute."
	permissions = FLAG_PERMISSION_MODERATOR
	protection = 97

/rank/administrator/
	name = "管理员"
	id = "ADMIN"
	desc = "Administrators can control the server to a stronger degree."
	permissions = FLAG_PERMISSION_MODERATOR | FLAG_PERMISSION_ADMIN | FLAG_PERMISSION_GAMEMASTER
	protection = 98

/rank/head_administrator/
	name = "主管理员"
	id = "HEADADMIN"
	desc = "Head Administrators can control the server to a stronger degree."
	permissions = FLAG_PERMISSION_MODERATOR | FLAG_PERMISSION_ADMIN | FLAG_PERMISSION_GAMEMASTER
	protection = 99

/rank/developer/
	name = "开发者"
	id = "DEV"
	desc = "Developers have access to debugging information and other commands that help with development."
	permissions = FLAG_PERMISSION_DEVELOPER
	protection = 5

/rank/gamemaster/
	name = "游戏主持人"
	id = "GAMEMASTER"
	desc = "Gamemasters have control over gamemaster related commands."
	permissions = FLAG_PERMISSION_GAMEMASTER
	protection = 5

/rank/host/
	name = "服主"
	id = "HOST"
	desc = "Hosts have all the power."
	protection = 100
	permissions = FLAG_PERMISSION_HOST | FLAG_PERMISSION_ADMIN | FLAG_PERMISSION_MODERATOR | FLAG_PERMISSION_DEVELOPER | FLAG_PERMISSION_GAMEMASTER
