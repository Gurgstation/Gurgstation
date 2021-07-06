/datum/trait/negative/deafness
	name = "Permanently deaf"
	desc = "You are deaf."
	cost = -5
	special_env = TRUE

/datum/trait/negative/deafness/handle_environment_special(var/mob/living/carbon/human/H)
	H.sdisabilities |= DEAF

/datum/trait/negative/mute
	name = "Mute"
	desc = "You cannot talk"
	cost = -2
	special_env = TRUE

/datum/trait/negative/mute/handle_environment_special(var/mob/living/carbon/human/H)
	H.sdisabilities |= MUTE