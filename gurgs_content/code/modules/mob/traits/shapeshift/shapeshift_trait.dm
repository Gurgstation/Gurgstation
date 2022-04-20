// Author - GremlingSS

// Absorbed gays are stored as DNA bubbles, similar to changelings, which when users have the shapeshifting trait, they can transform into the prey. 
// This also can work with digested prey but more permanent absorbed DNA.
// It's not intended to be persistent, do not try to make it persistent or suffer with gamebreaking issues. 
// This is because DNA is not designed to be serialisable, if you want to make it persistent, go the paradise route and have characters stored on the database. c:


/datum/trait/neutral/shapeshifter
	name = "Shapeshifter"
	desc = "You get to transform into your absorbed/digested prey."
	cost = 0
	custom_only = FALSE

/datum/trait/neutral/shapeshifter/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	spawn(100)

		var/datum/dna/newDNA = H.dna.Clone()
		var/datum/absorbed_dna/absorbedDNA = new(H.real_name, newDNA, H.species.name, H.languages, H.identifying_gender, H.flavor_texts, H.modifiers)

		absorbedDNA.SetupExtras(H, absorbedDNA)

		if(!H.GetAbsorbedDNA(absorbedDNA.name)) // Don't duplicate - I wonder if it's possible for it to still be a different DNA? DNA code could use a rewrite
			H.balls += absorbedDNA
		

		H.verbs |= /mob/living/proc/remove_prey_transform
		H.verbs |= /mob/living/proc/prey_transform
		H.verbs |= /mob/living/proc/remove_markings

