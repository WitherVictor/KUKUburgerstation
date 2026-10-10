/mob/living/advanced/player/proc/set_job(var/job/desired_job) //Setjob is only called when the player takes a new job.

	if(!desired_job)
		job = null
		job_rank = 1
		return TRUE

	if(desired_job == job)
		return FALSE

	var/job/J = JOB(desired_job)
	if(!J)
		return FALSE

	job = desired_job
	job_rank = 1
	job_next_promotion = world.realtime + 604800*10 //1 week

	src.to_chat(span("notice","你现在的岗位是[J.name]。"))

	return TRUE

/mob/living/advanced/player/proc/check_promotion()

	if(!job)
		return FALSE

	var/job/J = JOB(job)
	if(!J)
		return FALSE

	if(!job_next_promotion)
		return FALSE

	if(world.realtime < job_next_promotion)
		return FALSE

	var/rank_length = length(J.ranks)
	if(job_rank >= rank_length)
		return FALSE

	job_rank++
	job_next_promotion = world.realtime + 604800*10 //1 week

	src.to_chat(span("notice","你已从[J.get_rank_title(job_rank-1)]晋升为[J.get_rank_title(job_rank)]！你的技能、属性和薪水都提高了！"))

	return TRUE
