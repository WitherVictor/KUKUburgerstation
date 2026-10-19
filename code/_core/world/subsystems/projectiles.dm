

SUBSYSTEM_DEF(projectiles)
	name = "Projectile Subsystem"
	desc = "Controls projectiles."
	tick_rate = PROJECTILE_TICK
	priority = SS_ORDER_IMPORTANT

	tick_usage_max = 100

	use_time_dialation = FALSE

	hard_realtime = TRUE //战斗关键路径：投射物循环不允许被跳过或休眠。

	var/list/obj/projectile/all_projectiles = list()

/subsystem/projectiles/unclog(var/mob/activator)

	for(var/k in all_projectiles)
		var/obj/projectile/P = k
		all_projectiles -= k
		if(!P || P.qdeleting)
			continue
		qdel(P)

	return ..()

/subsystem/projectiles/on_life()

	//DM 的 for-in 遍历的是列表的临时副本（官方文档 for list proc），循环中移除元素不会影响本次遍历；
	//但副本仍会包含循环中途被 qdel 的投射物，所以这里跳过并清理已标记删除的对象。
	for(var/k in all_projectiles)
		var/obj/projectile/P = k
		if(!P || P.qdeleting)
			all_projectiles -= k
			continue
		var/result = P.update_projectile(tick_rate)
		if(result == null)
			log_error("Warning! Projectile [P.get_debug_name()] didn't run update_projectile properly, and thus was deleted.")
		if(!result)
			qdel(P) //投射物会在自己的 PreDestroy 中从列表中移除。

	return TRUE
