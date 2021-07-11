// Author - GremlingSS

// Absorbed gays are stored as DNA bubbles, similar to changelings, which when users have the shapeshifting trait, they can transform into the prey. 
// This also can work with digested prey but more permanent absorbed DNA.
// It's not intended to be persistent, do not try to make it persistent or suffer with gamebreaking issues. 

/datum/trait/neutral/shapeshifter
	name = "Shapeshifter"
	desc = "You get to transform into your absorbed/digested prey."
	cost = 0
	custom_only = FALSE

/datum/trait/neutral/shapeshifter/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
//	H.verbs |= /mob/living/carbon/human/proc/t_shapeshifter
