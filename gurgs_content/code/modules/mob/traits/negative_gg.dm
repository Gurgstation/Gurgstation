/datum/trait/negative/deafness
	name = "Permanently deaf"
	desc = "You are deaf."
	cost = -6 //gurgs change, -6 because your department radio is rendered useless. and strictly relying on line of sight for sign language
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