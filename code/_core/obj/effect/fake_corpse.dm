/obj/effect/fake_corpse
	name = "尸体"
	desc = "x长眠于此，至死都没能得手。"
	desc_extended = "某人的尸体。"
	appearance_flags = RESET_COLOR | RESET_ALPHA | RESET_TRANSFORM | LONG_GLIDE | KEEP_TOGETHER

	anchored = TRUE

/obj/effect/fake_corpse/proc/copy_body(var/mob/living/L)

	appearance = L.appearance

	name = L.name
	desc = "[L.name]长眠于此，至死都没能得手。"

	var/matrix/M = get_base_transform()
	M.Turn(90)
	transform = M

	return TRUE
