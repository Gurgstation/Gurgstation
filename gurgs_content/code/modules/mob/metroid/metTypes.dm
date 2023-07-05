GLOBAL_VAR_INIT(queen_amount, 0) //We only gonna want 1 queen in the world.

/*
//All the REAL types of metroids!
*/
//Remember to add vent crawling at some point.

/mob/living/simple_mob/metroid/jellybrig //Security's pet
	name = "Jellybrig"
	desc = "This one scree's happily at you."
	ai_holder_type = /datum/ai_holder/simple_mob/jellybrig //Instead of normal metroid code, this guy is basically a retaliatory punching bag.
	say_list_type = /datum/say_list/metroid
	faction = "notmetroid"
	maxHealth = 400
	health = 400
	melee_damage_lower = 2
	melee_damage_upper = 6
	movement_cooldown = 6
	harm_intent_damage = 3
	armor = list(
				"melee" = 50,
				"bullet" = -90,
				"laser" = 0,
				"energy" = -50,
				"bomb" = -100,
				"bio" = 100,
				"rad" = 100)
	vore_active = 1
	vore_bump_chance = 25
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 90 //Don't punch or grab this guy. He will grab you instead!
	swallowTime = 1 SECONDS //Hungry little bastards.
	vore_default_mode = DM_HOLD
	vore_digest_chance = 1		//Chance to switch to digest mode if resisted
	vore_absorb_chance = 0
	vore_escape_chance = 2		//Chance to escape if resisted.

/datum/ai_holder/simple_mob/jellybrig
	hostile = FALSE // The majority of simplemobs are hostile, jellybrig is nice.
	cooperative = FALSE
	retaliate = TRUE //so the monster can attack back
	returns_home = FALSE
	can_flee = FALSE
	wander = TRUE
	base_wander_delay = 9


/mob/living/simple_mob/metroid/mine
	name = "tallon metroid"
	desc = "A mutant metroid from Tallon. Not as dangerous, but still a threat."
	tt_desc = "Parasitus Anomalia"
	icon = 'gurgs_content/icons/mob/metroid/small.dmi'
	icon_dead = "metroid_dead"
	icon_living = "mochtroid"
	icon_state = "mochtroid"
	movement_cooldown = 2
	next = null

	vore_active = 1
	vore_pounce_chance = 25
	vore_icons = SA_ICON_LIVING

/mob/living/simple_mob/metroid/mine/init_vore()
	.=..()
	var/obj/belly/B = vore_selected
	B.digest_burn = 0.5
	B.digest_brute = 0


/mob/living/simple_mob/metroid/mine/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 50, 1)
	..()
	if(prob(20))
		visible_message("<span class='notice'>\The [src] dropped some toy!</span>")
		new /obj/item/toy/figure/bounty_hunter(loc, src)




/mob/living/simple_mob/metroid/juvenile
	var/is_juvenile = FALSE


/mob/living/simple_mob/metroid/juvenile/baby
	name = "metroid spawn"
	desc = "A fresh metroid spawn, ready for the world!"
	tt_desc = "Parasitus Puer"
	icon = 'gurgs_content/icons/mob/metroid/small.dmi'
	icon_dead = "baby_dead"
	icon_living = "baby"
	icon_state = "baby"
	ai_holder_type = /datum/ai_holder/simple_mob/juvenile_metroid
	say_list_type = /datum/say_list/metroid
	health = 200
	maxHealth = 200
	melee_damage_lower = 1
	melee_damage_upper = 5
	melee_miss_chance = 0
	armor = list(
				"melee" = 0,
				"bullet" = -60,
				"laser" = 60,
				"energy" = 10,
				"bomb" = -100,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	max_nutrition = 2200
	nutrition = 0

	//Metroids aren't affected by most atmospheres except cold.
	minbodytemp = T0C-40
	cold_damage_per_tick = 100
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0



	response_help = "pets"

	evo_point = 800
	evo_limit = 1000
	next = "/mob/living/simple_mob/metroid/juvenile/super"
	vore_active = 0

	is_juvenile = TRUE

/mob/living/simple_mob/metroid/juvenile/baby/Initialize()
	playsound(src, 'sound/metroid/metroidsee.ogg', 100, 1)
	..()



//------------------------------------------------------------------------------------------------------------




/mob/living/simple_mob/metroid/juvenile/super
	name = "larva metroid"
	desc = "A full grown metroid spawn, the first of many."
	tt_desc = "Parasitus Pariunt"
	icon = 'gurgs_content/icons/mob/metroid/small.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"
	ai_holder_type = /datum/ai_holder/simple_mob/juvenile_metroid
	say_list_type = /datum/say_list/metroid
	health = 250
	maxHealth = 250
	melee_damage_lower = 2
	melee_damage_upper = 9
	melee_miss_chance = 0
	armor = list(
				"melee" = 0,
				"bullet" = -50,
				"laser" = 70,
				"energy" = 10,
				"bomb" = -100,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	max_nutrition = 2200
	nutrition = 0

	//Metroids aren't affected by most atmospheres except cold.
	minbodytemp = T0C-40
	cold_damage_per_tick = 100
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0

	response_help = "pets"

	speak_emote = list(
		"Skree...",
		"Ereeeer..."
		)

	evo_point = 1200
	evo_limit = 1600
	next = "/mob/living/simple_mob/metroid/juvenile/alpha"

	is_juvenile = TRUE

/mob/living/simple_mob/metroid/juvenile/super/Initialize()
	playsound(src, 'sound/metroid/metroidsee.ogg', 100, 1)
	..()

/mob/living/simple_mob/metroid/juvenile/super/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

/mob/living/simple_mob/metroid/juvenile/alpha
	name = "alpha metroid"
	desc = "A metroid in it's Fresh Pupa lifecycle stage. It looks fairly dangerous."
	tt_desc = "Parasiticum Capra"
	icon = 'gurgs_content/icons/mob/metroid/small.dmi'
	icon_dead = "alpha_dead"
	icon_living = "alpha"
	icon_state = "alpha"
	ai_holder_type = /datum/ai_holder/simple_mob/juvenile_metroid
	say_list_type = /datum/say_list/metroid
	health = 300
	maxHealth = 300
	melee_damage_lower = 10
	melee_damage_upper = 15
	melee_miss_chance = 5
	attacktext = list("rammed")
	armor = list(
				"melee" = 40,
				"bullet" = 15,
				"laser" = 50,
				"energy" = 60,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	max_nutrition = 2200
	nutrition = 0

	//Alphas lose their vulnerability to cold.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	evo_point = 1000
	evo_limit = 1500
	next = "/mob/living/simple_mob/metroid/juvenile/gamma"

/mob/living/simple_mob/metroid/juvenile/alpha/Initialize()
	playsound(src, 'sound/metroid/metroidsee.ogg', 100, 1)
	..()

/mob/living/simple_mob/metroid/juvenile/alpha/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

/mob/living/simple_mob/metroid/juvenile/alpha //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 15 //Alphas will try knocking targets over since they lost their stun ability from the initial phases.
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	vore_escape_chance = 40






//------------------------------------------------------------------------------------------------------------



/mob/living/simple_mob/metroid/juvenile/gamma
	name = "gamma metroid"
	desc = "A metroid in it's Pupa lifecycle stage. It looks quite dangerous."
	tt_desc = "Parasitica Homo Comedentis"
	icon = 'gurgs_content/icons/mob/metroid/small.dmi'
	icon_dead = "gamma_dead"
	icon_living = "gamma"
	icon_state = "gamma"
	ai_holder_type = /datum/ai_holder/simple_mob/juvenile_metroid
	say_list_type = /datum/say_list/metroid
	movement_cooldown = 2
	health = 400
	maxHealth = 400
	melee_damage_lower = 10
	melee_damage_upper = 20
	melee_miss_chance = 5
	attacktext = list("rammed")
	armor = list(
				"melee" = 55,
				"bullet" = 15,
				"laser" = 50,
				"energy" = 90,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	max_nutrition = 2200
	nutrition = 0
	ranged_attack_delay = 5 SECOND
	projectilesound = 'sound/weapons/taser2.ogg'
	projectiletype = /obj/item/projectile/beam/stun/weak

	//Not affected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	var/emp_chance = 20 // Beware synths
	evo_point = 1000
	evo_limit = 1500
	next = "/mob/living/simple_mob/metroid/juvenile/zeta"

/mob/living/simple_mob/metroid/juvenile/gamma/Initialize()
	playsound(src, 'sound/metroid/metroidgamma.ogg', 100, 1)
	..()

/mob/living/simple_mob/metroid/juvenile/gamma/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

/mob/living/simple_mob/metroid/juvenile/gamma //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 15
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	vore_escape_chance = 30


/datum/say_list/metroid
	speak = list("Skree.", "Eree.", "Errer?")
	emote_see = list("floats about","looks around", "rubs its talons")
	emote_hear = list("chitters")

	say_understood = list("Eree.")
	say_cannot = list("Errerr.")
	say_maybe_target = list("Eree?")
	say_got_target = list("Ereet!")
	say_threaten = list("Skree!")
	say_stand_down = list("Eee.")
	say_escalate = list("SKREE!")

	threaten_sound = 'sound/metroid/metroidsee.ogg'
	stand_down_sound = 'sound/metroid/metroiddetach.ogg'


//------------------------------------------------------------------------------------------------------------



/mob/living/simple_mob/metroid/juvenile/zeta
	name = "zeta metroid"
	desc = "A metroid in it's Young Adult lifecycle stage. It looks exceptionally dangerous."
	tt_desc = "Parasitica Gigans Armati"
	icon = 'gurgs_content/icons/mob/metroid/large.dmi'
	icon_dead = "zeta_dead"
	icon_living = "zeta"
	icon_state = "zeta"
	ai_holder_type = /datum/ai_holder/simple_mob/juvenile_metroid
	say_list_type = /datum/say_list/metroid/zeta
	movement_cooldown = 2
	health = 500
	maxHealth = 500
	melee_damage_lower = 15
	melee_damage_upper = 25
	melee_miss_chance = 5
	ranged_attack_delay = 5 SECOND
	attack_armor_pen = 10
	attacktext = list("slashed")
	armor = list(
				"melee" = 70,
				"bullet" = 0,
				"laser" = 50,
				"energy" = 60,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	max_nutrition = 2200
	nutrition = 0

	makes_dirt = TRUE

	projectiletype	= /obj/item/projectile/energy/metroidacid	//The projectiles I shoot
	projectilesound = 'sound/weapons/slashmiss.ogg' // The sound I make when I do it


	//Unaffected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	pixel_x = -16
	pixel_y = -16
	old_x = -16
	old_y = -16
	evo_point = 1200
	evo_limit = 1500
	next = "/mob/living/simple_mob/metroid/juvenile/omega"

/mob/living/simple_mob/metroid/juvenile/zeta/Initialize()
	playsound(src, 'sound/metroid/metroidzeta.ogg', 100, 1)
	..()

/mob/living/simple_mob/metroid/juvenile/zeta/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

/mob/living/simple_mob/metroid/juvenile/zeta //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 20
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	vore_escape_chance = 20

/datum/say_list/metroid/zeta
	speak = list("Rurrr.", "Rrerr.", "Rawr?")
	emote_see = list("stomps about","looks around", "rubs its talons")
	emote_hear = list("chitters")

	say_understood = list("Rur.")
	say_cannot = list("Errurr.")
	say_maybe_target = list("Erurr?")
	say_got_target = list("Eruur!")
	say_threaten = list("Rrurr!")
	say_stand_down = list("Eeer.")
	say_escalate = list("RAWR!")

	threaten_sound = 'sound/metroid/metroidzeta.ogg'
	stand_down_sound = 'sound/metroid/metroiddetach.ogg'


//------------------------------------------------------------------------------------------------------------



/mob/living/simple_mob/metroid/juvenile/omega
	name = "omega metroid"
	desc = "A fully grown adult metroid. It looks excessively dangerous."
	tt_desc = "Parasitica Cataphractos Monstrum"
	icon = 'gurgs_content/icons/mob/metroid/large.dmi'
	icon_dead = "omega_dead"
	icon_living = "omega"
	icon_state = "omega"
	ai_holder_type = /datum/ai_holder/simple_mob/juvenile_metroid
	say_list_type = /datum/say_list/metroid/omega
	movement_cooldown = 2.5
	health = 600
	maxHealth = 600
	melee_damage_lower = 25
	melee_damage_upper = 40
	melee_miss_chance = 5
	ranged_attack_delay = 2.5 SECOND
	attack_armor_pen = 20
	attacktext = list("slashed")
	armor = list(
				"melee" = 75,
				"bullet" = 20,
				"laser" = 55,
				"energy" = 60,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	max_nutrition = 2200
	nutrition = 0
	makes_dirt = TRUE
	projectiletype	= /obj/item/projectile/beam/smalllaser	// The projectiles I shoot
	projectilesound = 'sound/weapons/Flamer.ogg' // The sound I make when I do it

	//Unaffected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0



	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	evo_point = 1300
	evo_limit = 2000
	next = "/mob/living/simple_mob/metroid/juvenile/queen"

/mob/living/simple_mob/metroid/juvenile/omega/Initialize()
	playsound(src, 'sound/metroid/metroidomega.ogg', 100, 1)
	..()

/mob/living/simple_mob/metroid/juvenile/omega/death()
	playsound(src, 'sound/metroid/metroidomegadeath.ogg', 100, 1)
	..()

/mob/living/simple_mob/metroid/juvenile/omega //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 2
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 40
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	vore_escape_chance = 10

/datum/say_list/metroid/omega
	speak = list("Rurrr.", "Rrerr.", "Rawr?")
	emote_see = list("stomps about","looks around", "rubs its talons")
	emote_hear = list("chitters")

	say_understood = list("Rur.")
	say_cannot = list("Errurr.")
	say_maybe_target = list("Erurr?")
	say_got_target = list("Roar!")
	say_threaten = list("Rrurr!")
	say_stand_down = list("Eeer.")
	say_escalate = list("ROAR!")

	threaten_sound = 'sound/metroid/metroidomega.ogg'
	stand_down_sound = 'sound/metroid/metroiddetach.ogg'


//------------------------------------------------------------------------------------------------------------



/mob/living/simple_mob/metroid/juvenile/queen
	name = "queen metroid"
	desc = "The mother of all Metroids - the metroid queen. RUN!"
	tt_desc = "Mater Parasiti Mortis"
	icon = 'gurgs_content/icons/mob/metroid/queen.dmi'
	icon_dead = "queen_dead"
	icon_living = "queen"
	icon_state = "queen"
	ai_holder_type = /datum/ai_holder/simple_mob/juvenile_metroid
	say_list_type = /datum/say_list/metroid/queen
	movement_cooldown = 3
	health = 1000
	maxHealth = 1000
	melee_damage_lower = 30
	melee_damage_upper = 60
	melee_miss_chance = 5
	attack_armor_pen = 20
	attacktext = list("gnashed")
	armor = list(
				"melee" = 75,
				"bullet" = 40,
				"laser" = 60,
				"energy" = 90,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	max_nutrition = 2200
	nutrition = 0
	makes_dirt = TRUE
	ranged_attack_delay = 1.5 SECOND
	projectiletype	= /obj/item/projectile/energy/metroidacid	// The projectiles I shoot
	projectilesound = 'sound/weapons/slashmiss.ogg' // The sound I make when I do it

	//Unaffected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	pixel_x = -16
	pixel_y = -16
	old_x = -16
	old_y = -16
	evo_point = 1200
	evo_limit = INFINITY
	next = null
	is_queen = TRUE

/mob/living/simple_mob/metroid/juvenile/queen/Initialize()
	playsound(src, 'sound/metroid/metroidqueen.ogg', 100, 1)
	GLOB.queen_amount++
	..()

/mob/living/simple_mob/metroid/juvenile/queen/death()
	playsound(src, 'sound/metroid/metroidqueendeath.ogg', 100, 1)
	GLOB.queen_amount--
	..()

/mob/living/simple_mob/metroid/juvenile/queen //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 4
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 60 //It's the queen, and it's hungry.
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	vore_escape_chance = 0 //You're not climbing out of that neck

/datum/say_list/metroid/queen
	speak = list("Rurrr.", "Rrerr.", "Rawr?")
	emote_see = list("stomps about","looks around", "rubs its talons")
	emote_hear = list("chitters")

	say_understood = list("Rur.")
	say_cannot = list("Errurr.")
	say_maybe_target = list("Erurr?")
	say_got_target = list("Roar!")
	say_threaten = list("Rrurr!")
	say_stand_down = list("Eeer.")
	say_escalate = list("ROAR!")

	threaten_sound = 'sound/metroid/metroidqueen.ogg'
	stand_down_sound = 'sound/metroid/metroiddetach.ogg'
