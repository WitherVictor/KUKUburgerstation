/objective/dummy
	name = "占位任务"
	var/completed = FALSE
	credit_reward = 100
	burgerbux_reward = 1

/objective/dummy/get_description()
	return "什么都不用做。"

/objective/dummy/check_completion()

	if(completed)
		return COMPLETED

	return ..()
