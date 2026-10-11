/area/mission/prefab/misc
	icon_state = "red"

/area/mission/prefab/misc/cult_hall
	name = "遗忘的邪教神龛"
	interior = TRUE

/area/mission/prefab/misc/rng_shrine
	name = "奇异幸运神龛"
	interior = TRUE

/area/mission/prefab/misc/clockwork_hall
	name = "发条大厅"
	interior = TRUE
	requires_power = FALSE
	flags_area = FLAG_AREA_NO_HORDE | FLAG_AREA_IMPORTANT

/area/mission/prefab/misc/cult
	name = "邪教徒区域"
	interior = TRUE

/area/mission/prefab/misc/golem
	name = "魔像飞船驾驶舱"
	requires_power = TRUE
	interior = TRUE
	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO
	link_to_parent_apc = TRUE

/area/mission/prefab/misc/golem/center
	name = "魔像飞船中央通道"
	icon_state = "blue"

/area/mission/prefab/misc/golem/left
	name = "魔像飞船左翼"
	icon_state = "green"

/area/mission/prefab/misc/golem/right
	name = "魔像飞船右翼"
	icon_state = "yellow"

/area/mission/prefab/misc/syndicate_antag_ship
	name = "辛迪加飞船"
	requires_power = TRUE
	interior = TRUE
	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO

/area/mission/prefab/misc/syndicate_dock
	name = "辛迪加码头"
	requires_power = TRUE
	interior = TRUE
	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO

/area/mission/prefab/misc/syndicate_mining_outpost
	name = "辛迪加采矿前哨站"
	requires_power = TRUE
	interior = TRUE
	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO

/area/mission/prefab/misc/syndicate_mining_outpost/landing_bay
	icon_state = "green"

/area/mission/prefab/misc/syndicate_mining_outpost/engineering
	icon_state = "engineering"

/area/mission/prefab/misc/syndicate_mining_outpost/cargo
	icon_state = "cargo"

/area/mission/prefab/misc/syndicate_mining_outpost/mining
	icon_state = "mining"

/area/mission/prefab/misc/syndicate_mining_outpost/service
	icon_state = "service"

/area/mission/prefab/misc/syndicate_mining_outpost/medical
	icon_state = "service"

/area/mission/prefab/misc/syndicate_mining_outpost/hall
	icon_state = "blue"

/area/mission/prefab/misc/syndicate_mining_outpost/entrance
	icon_state = "arrivals"

/area/mission/prefab/misc/syndicate_research_outpost
	name = "辛迪加科研前哨站"
	requires_power = TRUE
	interior = TRUE
	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO


/area/mission/prefab/misc/xenomorph_hive
	name = "\improper 异形巢穴"
	interior = TRUE


/area/mission/prefab/misc/unconstructed_syndicate_base
	name = "\improper 未完工的辛迪加基地"
	interior = TRUE
	requires_power = TRUE
	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO

/area/mission/prefab/misc/unconstructed_syndicate_base/subsection
	name = "\improper 未完工的辛迪加基地－分区"
	icon_state = "blue"


/area/mission/prefab/misc/rev_base_1
	name = "革命军基地"
	requires_power = TRUE
	interior = TRUE
	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO

/area/mission/prefab/misc/rev_base_2
	name = "革命军基地2"
	requires_power = TRUE
	interior = TRUE
	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO

/area/mission/prefab/misc/rev_base_3
	name = "革命军基地3"
	requires_power = TRUE
	interior = TRUE
	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO


/area/mission/prefab/misc/ai_core
	name = "AI核心"
	requires_power = TRUE
	interior = TRUE
	default_state_power_lights = ON|AUTO
	default_state_power_machines = ON|AUTO
	default_state_power_doors = ON|AUTO

	flags_area = FLAG_AREA_NO_HORDE | FLAG_AREA_IMPORTANT

/area/mission/prefab/misc/ai_core/entrance
	name = "AI入口"
	icon_state = "red"

/area/mission/prefab/misc/ai_core/foyer
	name = "AI门厅"
	icon_state = "green"

/area/mission/prefab/misc/ai_core/core
	name = "AI核心"
	icon_state = "blue"

/area/mission/prefab/misc/ai_core/maint/
	icon_state = "yellow"

/area/mission/prefab/misc/ai_core/maint/left
	name = "AI维护区左翼"

/area/mission/prefab/misc/ai_core/maint/right
	name = "AI维护区右翼"

/area/mission/prefab/misc/ai_core/engine
	name = "AI引擎室"
	icon_state = "orange"
