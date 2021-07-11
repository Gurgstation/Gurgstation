// Author - GremlingSS

// Absorbed gays are stored as DNA bubbles, similar to changelings, which when users have the shapeshifting trait, they can transform into the prey. 
// This also can work with digested prey but more permanent absorbed DNA.
// It's not intended to be persistent, do not try to make it persistent or suffer with gamebreaking issues. 

/mob/living/
	var/list/datum/absorbed_dna/absorbedPreys = list() // Why not use this? It's got everything I need.

/mob/living/proc/GetAbsorbedDNA(var/dna_owner)
	for(var/datum/absorbed_dna/DNA in absorbedPreys)
		if(dna_owner == DNA.name)
			return DNA