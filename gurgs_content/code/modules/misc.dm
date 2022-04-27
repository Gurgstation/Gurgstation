// Random unsorted shit can go here! WOOO!

// Used in job_controller.dm for late vore joining.
/datum/controller/occupations/proc/m_backup_client(var/client/C)	//Same as m_backup, but takes a client entry. Used for vore late joining.
	if(!ishuman(C.mob))
		return
	var/mob/living/carbon/human/CM = C.mob
	SStranscore.m_backup(CM.mind, CM.nif, TRUE)

/obj/structure/mob_spawner/scanner/mining_animals
	name = "Mining Lazy Spawner"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = "wild animal"
	total_spawns = 2
	destructible = 0
	anchored = 1
	invisibility = 101
	spawn_types = list(
		/mob/living/silicon/robot/lost = 2,
		/mob/living/simple_mob/mechanical/hivebot/swarm = 1,
		/mob/living/simple_mob/animal/space/carp = 10,
		/obj/structure/closet/crate/mimic = 2,
		/mob/living/simple_mob/animal/space/bats = 70,
		/mob/living/simple_mob/animal/space/jelly = 25,
		/mob/living/simple_mob/animal/space/bear = 1,
		/mob/living/simple_mob/vore/aggressive/deathclaw = 1,
		/mob/living/simple_mob/animal/space/goose = 60,
		/mob/living/simple_mob/vore/bee = 50,
		/mob/living/simple_mob/metroid/mine = 20,
	)


//   STOP
//   POSTING
//   ABOUT
//   maps\triumph\triumph-05-flagship.dmm:419:error: undefined type: /obj/item/weapon/storage/box/beanbags/large
//   I'M TIRED OF SEEING IT! MY FRIENDS ON TIKTOK SEND ME MEMES, ON DISCORD IT'S FUCKING MEMES! I was in a server, right? and ALL OF THE CHANNELS were just among us stuff. I-I showed my champion underwear to my girlfriend and t-the logo I flipped it and I said "hey babe, when the underwear is sus HAHA DING DING DING DING DING DING DING DI DI DING" I fucking looked at a trashcan and said "THAT'S A BIT SUSSY" I looked at my penis I think of an astronauts helmet and I go "PENIS? MORE LIKE PENSUS" AAAAAAAAAAAAAAHGESFG
/obj/item/weapon/storage/box/stunshells
	name = "box of stun shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	icon_state = "stunshot_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/stunshell = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/flashshells
	name = "box of illumination shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	icon_state = "illumshot_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/flash = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/sniperammo
	name = "box of 14.5mm shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	starts_with = list(/obj/item/ammo_casing/a145 = 7)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'


/obj/item/weapon/storage/box/stunshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/stunshell = 16)

/obj/item/weapon/storage/box/flashshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/flash = 16)

/obj/item/weapon/storage/box/beanbags/large
	starts_with = list(/obj/item/ammo_casing/a12g/beanbag = 16)

/obj/item/weapon/storage/box/shotgunammo/large
	starts_with = list(/obj/item/ammo_casing/a12g = 16)

/obj/item/weapon/storage/box/shotgunshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/pellet = 16)

/obj/item/weapon/storage/box/practiceshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/practice = 16)

/obj/item/weapon/storage/box/empshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/emp = 16)
