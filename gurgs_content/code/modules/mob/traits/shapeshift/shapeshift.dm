// Author - GremlingSS

// Absorbed gays are stored as DNA bubbles, similar to changelings, which when users have the shapeshifting trait, they can transform into the prey. 
// This also can work with digested prey but more permanent absorbed DNA.
// It's not intended to be persistent, do not try to make it persistent or suffer with gamebreaking issues. 

//
// Big brain definitions before we get to the half-meaty bit of code
//

/datum/vore_preferences
	var/can_be_transformed = FALSE

/mob/living/
	var/can_be_transformed = FALSE
	var/list/datum/absorbed_dna/absorbedPreys = list() // Why not use this? It's got everything I need.

/mob/living/proc/GetAbsorbedDNA(var/dna_owner)
	for(var/datum/absorbed_dna/DNA in absorbedPreys)
		if(dna_owner == DNA.name)
			return DNA

/mob/living/proc/AbsorbPreyDNA(mob/living/M)
	if(M.can_be_transformed)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			var/datum/absorbed_dna/newDNA = new(H.real_name, H.dna, H.species.name, H.languages, H.identifying_gender, H.flavor_texts, H.modifiers)

			if(!GetAbsorbedDNA(newDNA.name)) // Don't duplicate - I wonder if it's possible for it to still be a different DNA? DNA code could use a rewrite
				absorbedPreys += newDNA

//
// Preparation for the actual stuff. This includes refactoring unabsorption, adding the prey's DNA to the player's list and also removing it on unabsorption, hence refactorising.
//

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
	if(M.can_be_transformed)
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


//
// The meaty bit~
//

// gamer

/mob/living/proc/prey_transform()
	set category = "Abilities"
	set name = "Shapeshift into Prey"


	var/size_mult = size_multiplier // Fixes random issue of size_multiplier going to 0.

	var/list/names = list()
	for(var/datum/absorbed_dna/DNA in absorbedPreys)
		names += "[DNA.name]"

	var/S = tgui_input_list(src, "Select the prey:", "Pick which Prey", names)
	if(!S)	return

	var/datum/absorbed_dna/chosen_dna = GetAbsorbedDNA(S)
	if(!chosen_dna)
		return

	src.visible_message("<span class='warning'>[src] transforms!</span>")

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
//	changeling_update_languages(changeling.absorbed_languages)
	if(chosen_dna.genMods)
		var/mob/living/carbon/human/self = src
		for(var/datum/modifier/mod in self.modifiers)
			self.modifiers.Remove(mod.type)

		for(var/datum/modifier/mod in chosen_dna.genMods)
			self.modifiers.Add(mod.type)

	// Ooooh! That's a clever way to do a cooldown!
	src.verbs -= /mob/living/proc/prey_transform
	spawn(10)
		src.verbs += /mob/living/proc/prey_transform
		src.regenerate_icons()

	src.resize(size_mult) // Fixes random issue of size_multiplier going to 0.
	return 1

// Forget Prey you wish you forget.
/mob/living/proc/remove_prey_transform()
	set category = "Abilities"
	set name = "Forget Prey"

	var/list/names = list()
	for(var/datum/absorbed_dna/DNA in absorbedPreys)
		names += "[DNA.name]"

	var/S = tgui_input_list(src, "Select the prey to forget:", "Prey-B-Gone", names)
	if(!S)	return

	var/datum/absorbed_dna/chosen_dna = GetAbsorbedDNA(S)
	if(chosen_dna)
		if(tgui_alert(src, "Are you sure you want to forget this? You won't remember it unless you reabsorb or digest them again!", "Forget Prey",list("No","Yes")) == "Yes")
			absorbedPreys -= chosen_dna
			return 1
	return 0


