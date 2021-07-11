// Author - GremlingSS

// Absorbed gays are stored as DNA bubbles, similar to changelings, which when users have the shapeshifting trait, they can transform into the prey. 
// This also can work with digested prey but more permanent absorbed DNA.
// It's not intended to be persistent, do not try to make it persistent or suffer with gamebreaking issues. 

/obj/belly/proc/unabsorb_mob(mob/living/L, var/nutrientLoss = 0)
	L.absorbed = FALSE
	to_chat(L, "<span class='notice'>You suddenly feel solid again.</span>")
	to_chat(owner,"<span class='notice'>You feel like a part of you is missing.</span>")
	if(nutrientLoss)
		owner.adjust_nutrition(-100)

	var/preyDNA = owner.GetAbsorbedDNA(L.real_name)
	if(preyDNA)
		owner.absorbedPreys -= preyDNA

/datum/digest_mode/unabsorb/process_mob(obj/belly/B, mob/living/L) // Gurgs OVERRIDE
	if(L.absorbed && B.owner.nutrition >= 100)
		B.unabsorb_mob(L,1)
		return list("to_update" = TRUE)

/obj/belly/proc/AbsorbPreyDNA(mob/living/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/datum/absorbed_dna/newDNA = new(H.real_name, H.dna, H.species.name, H.languages, H.identifying_gender, H.flavor_texts, H.modifiers)

		if(!owner.GetAbsorbedDNA(newDNA.name)) // Don't duplicate - I wonder if it's possible for it to still be a different DNA? DNA code could use a rewrite
			owner.absorbedPreys += newDNA

/obj/belly/absorb_living(mob/living/M)
	..()
	AbsorbPreyDNA(M)

/obj/belly/digestion_death(mob/living/M)
	AbsorbPreyDNA(M)
	..()

/*
//Change our DNA to that of somebody we've absorbed.
/mob/proc/changeling_transform()
	set category = "Changeling"
	set name = "Transform (5)"

	var/datum/changeling/changeling = changeling_power(5,1,0)
	if(!changeling)	return

	if(!isturf(loc))
		to_chat(src, "<span class='warning'>Transforming here would be a bad idea.</span>")
		return 0

	var/list/names = list()
	for(var/datum/absorbed_dna/DNA in changeling.absorbed_dna)
		names += "[DNA.name]"

	var/S = tgui_input_list(src, "Select the target DNA:", "Target DNA", names)
	if(!S)	return

	var/datum/absorbed_dna/chosen_dna = changeling.GetDNA(S)
	if(!chosen_dna)
		return

	changeling.chem_charges -= 5
	src.visible_message("<span class='warning'>[src] transforms!</span>")
	changeling.geneticdamage = 5

	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		var/newSpecies = chosen_dna.speciesName
		H.set_species(newSpecies,1)

	src.dna = chosen_dna.dna.Clone()
	src.dna.b_type = "AB+" //This is needed to avoid blood rejection bugs.  The fact that the blood type might not match up w/ records could be a *FEATURE* too.
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		H.b_type = "AB+" //For some reason we have two blood types on the mob.
		H.identifying_gender = chosen_dna.identifying_gender
		H.flavor_texts = chosen_dna.flavour_texts ? chosen_dna.flavour_texts.Copy() : null
	src.real_name = chosen_dna.name
	src.UpdateAppearance()
	domutcheck(src, null)
	changeling_update_languages(changeling.absorbed_languages)
	if(chosen_dna.genMods)
		var/mob/living/carbon/human/self = src
		for(var/datum/modifier/mod in self.modifiers)
			self.modifiers.Remove(mod.type)

		for(var/datum/modifier/mod in chosen_dna.genMods)
			self.modifiers.Add(mod.type)

	src.verbs -= /mob/proc/changeling_transform
	spawn(10)
		src.verbs += /mob/proc/changeling_transform
		src.regenerate_icons()

	feedback_add_details("changeling_powers","TR")
	return 1
*/