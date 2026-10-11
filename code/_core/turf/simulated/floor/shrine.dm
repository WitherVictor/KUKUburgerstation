/turf/simulated/floor/shrine
	name = "远古神龛地板"
	icon = 'icons/turf/floor/shrine.dmi'
	icon_state = "0"


/turf/simulated/floor/shrine/New(var/desired_loc)
	. = ..()
	if(prob(25))
		icon_state = "[rand(1,4)]"
