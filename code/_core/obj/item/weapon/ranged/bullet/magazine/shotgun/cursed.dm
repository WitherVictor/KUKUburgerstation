/obj/item/weapon/ranged/bullet/magazine/shotgun/bulldog/cursed
	name = "\improper 诅咒猎犬"
	desc = "想用更阴森的方式清空房间时，就用它。"
	desc_extended = "痴迷弹药的诡异力量附在了这把霰弹枪的下机匣上，开火时会将普通霰弹替换为魔法弹体。试图弄明白现实边缘之外的神明为何想要20号鹿弹，只会把自己逼疯。"
	icon = 'icons/obj/item/weapons/ranged/shotgun/cursed.dmi'
	icon_state = "inventory"
	value = 2700
	projectile = /obj/projectile/magic/chaos
	ranged_damage_type = /damagetype/ranged/magic/chaos/canine

	bullet_length_min = 17
	bullet_length_best = 16.66
	bullet_length_max = 18

	tier = 4

	bullet_count = 4
	projectile_speed = TILE_SIZE*0.2 - 1

/obj/item/weapon/ranged/bullet/magazine/shotgun/bulldog/cursed/get_ranged_damage_type()
    return /damagetype/ranged/magic/chaos

/obj/item/weapon/ranged/bullet/magazine/shotgun/bulldog/cursed/spend_chambered_bullet(var/mob/caller) //magazine/shotgun/bulldog/cursed/
    //remove a bullet from the chamber, but make a new one to return.
    if(!chambered_bullet || chambered_bullet.is_spent)
        return FALSE

    var/obj/item/bullet_cartridge/shotgun_20/cursed/S = new()
    INITIALIZE(S)
    FINALIZE(S)

    chambered_bullet = S

    . = chambered_bullet.spend_bullet(caller,0)

    if(chambered_bullet.qdeleting)
        chambered_bullet = null
