/datum/species
	var/list/env_traits = list()
	var/dirtslip = FALSE
	var/photosynthesizing = FALSE
	var/grows = FALSE
	var/shrinks = FALSE
	var/rad_levels = list("safe" = 2.5, "danger_1" = 50, "danger_2" = 75, "danger_3" = 150)
	var/rad_removal_mod = 1
	var/bite_mod = 1
	var/grab_resist_divisor_victims = 1
	var/grab_resist_divisor_self = 1
	var/grab_power_victims = 0
	var/grab_power_self = 0
	var/waking_speed = 1
	var/mudking = FALSE

/datum/species/handle_environment_special(var/mob/living/carbon/human/H)
	for(var/datum/trait/env_trait in env_traits)
		env_trait.handle_environment_special(H)
	return


/// CODE TO ADD AI_HOLDERS TO SPECIES
#define AI_NO_PROCESS			0
#define AI_PROCESSING			(1<<0)
#define AI_FASTPROCESSING		(1<<1)

/datum/species
	var/ai_holder_type_override = null
	var/say_list_type_override = null

/datum/species/handle_post_spawn(var/mob/living/carbon/human/H)
	..()
	if(say_list_type_override)
		H.say_list = new say_list_type_override(H) // for some reason this doesn't initialise if I give it say_list_type.
	if(ai_holder_type_override)
		H.ai_holder_type = ai_holder_type_override
		if(!H.key)
			H.ai_holder.manage_processing(AI_PROCESSING) // Safety net to make sure it processes.

// EXAMPLE CODE OF HOW TO USE THIS
/*
/datum/say_list/monke
	emote_hear = list("whoops","gibbers","chatters","screeches")
	emote_see = list("scratches its head", "jumps", "rolls around")

/datum/species/monkey // mmm, monke
	ai_holder_type_override = /datum/ai_holder/simple_mob/melee/hit_and_run
	say_list_type_override = /datum/say_list/monke

// Putting this here to stop the monkey's stupid AI from overlapping.
/datum/species/monkey/handle_npc(var/mob/living/carbon/human/H)
	if(H.stat == CONSCIOUS && H.ai_holder)
		if(H.resting)
			H.resting = FALSE
			H.update_canmove()
	return
*/