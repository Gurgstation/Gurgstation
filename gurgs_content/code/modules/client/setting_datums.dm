// Gurgs ADD: Imports belches, brp~
// Impacts game/sound.dm, needs to have a list of the sounds.
/datum/client_preference/belch_noises
	description = "Burping"
	key = "BELCH_NOISES"
	enabled_description = "Noisy"
	disabled_description = "Silent"
	enabled_by_default = FALSE

// Impacts human_movement_ch.dm, playsound preference parameter
/datum/client_preference/slosh_noises
	description = "Walking sloshes"
	key = "WALKING_SLOSHES"
	enabled_description = "Walking slosh noises"
	disabled_description = "No walking slosh noises"
	enabled_by_default = FALSE