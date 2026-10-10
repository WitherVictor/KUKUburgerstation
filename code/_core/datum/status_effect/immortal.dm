/status_effect/immortal
	name = "永生"
	desc = "你获得了永生。恭喜啊，作弊者。"
	id = IMMORTAL

	affects_dead = TRUE

	minimum = SECONDS_TO_DECISECONDS(1)
	maximum = SECONDS_TO_DECISECONDS(10)
	default_duration = -1

/status_effect/dummy
	name = "占位状态"
	desc = "你处于占位状态。本不该显示这条信息。"
	id = DUMMY

	affects_dead = TRUE

	minimum = SECONDS_TO_DECISECONDS(1)
	maximum = SECONDS_TO_DECISECONDS(10)
	default_duration = -1
