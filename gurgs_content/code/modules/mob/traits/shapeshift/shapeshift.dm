// Author - GremlingSS

// Absorbed gays are stored as DNA bubbles, similar to changelings, which when users have the shapeshifting trait, they can transform into the prey. 
// This also can work with digested prey but more permanent absorbed DNA.
// It's not intended to be persistent, do not try to make it persistent or suffer with gamebreaking issues. 

//
// Big brain definitions before we get to the half-meaty bit of code
//

/datum/absorbed_dna
	var/size_multiplier

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

			newDNA.SetupExtras(M, newDNA)

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

			newDNA.SetupExtras(H, newDNA)

			if(!owner.GetAbsorbedDNA(newDNA.name)) // Don't duplicate - I wonder if it's possible for it to still be a different DNA? DNA code could use a rewrite
				owner.absorbedPreys += newDNA

/obj/belly/absorb_living(mob/living/M)
	..()
	AbsorbPreyDNA(M)

/obj/belly/digestion_death(mob/living/M)
	AbsorbPreyDNA(M)
	..()

/datum/absorbed_dna/proc/SetupExtras(var/mob/living/M, var/datum/absorbed_dna/new_dna)
	new_dna.size_multiplier = M.size_multiplier
	



//
// The meaty bit~
//

/mob/living/proc/prey_transform()
	set category = "Abilities"
	set name = "Shapeshift into Prey"

	var/list/names = list()
	for(var/datum/absorbed_dna/DNA in absorbedPreys)
		names += "[DNA.name]"

	var/S = tgui_input_list(src, "Select the prey:", "Pick which Prey", names)
	if(!S)	return

	var/datum/absorbed_dna/chosen_dna = GetAbsorbedDNA(S)
	if(!chosen_dna)
		return

	var/list/partlist = list("ears", "ears color","hair", "hair color", "face", "facial hair", "facial hair color", "body color", "species", "wings", "wings color", "tail", "tail_color", "gender", "markings", "all")
	var/chosenPart = tgui_input_list(usr, "Select part:", "Poggers", partlist)
	
	if(chosenPart)
		src.transform_part(chosenPart, chosen_dna)
	
	// Ooooh! That's a clever way to do a cooldown!
	src.verbs -= /mob/living/proc/prey_transform
	spawn(10)
		src.verbs += /mob/living/proc/prey_transform
		src.regenerate_icons()

	return 1

/mob/living/proc/transform_part(var/part, var/datum/absorbed_dna/chosen_dna)
	if(!part)	return
	if(!ishuman(src))	return

	var/mob/living/carbon/human/H = src

	src.visible_message("<span class='warning'>[src] transforms!</span>")

	var/sizeMult = H.size_multiplier

	switch(part)
		if("ears")
			var/ears = chosen_dna.dna.GetUIValueRange(DNA_UI_EAR_STYLE, ear_styles_list.len + 1) - 1
			if((0 < ears) && (ears <= ear_styles_list.len))
				H.dna.SetUIValueRange(DNA_UI_EAR_STYLE,	ears + 1,    ear_styles_list.len + 1,  1)
				H.ear_style = ear_styles_list[ear_styles_list[ears]]
		
		if("ears color") // Reeee Why not just store a hex string instead of 3 seperate colors- i mean, I understand you want to be able to change hair colors individually but REEE
			var/rEars = chosen_dna.dna.GetUIValueRange(DNA_UI_EARS_R,    255)
			var/gEars = chosen_dna.dna.GetUIValueRange(DNA_UI_EARS_G,    255)
			var/bEars = chosen_dna.dna.GetUIValueRange(DNA_UI_EARS_B,    255)

			var/rEars2 = chosen_dna.dna.GetUIValueRange(DNA_UI_EARS2_R,    255)
			var/gEars2 = chosen_dna.dna.GetUIValueRange(DNA_UI_EARS2_G,    255)
			var/bEars2 = chosen_dna.dna.GetUIValueRange(DNA_UI_EARS2_B,    255)

			var/rEars3 = chosen_dna.dna.GetUIValueRange(DNA_UI_EARS3_R,    255)
			var/gEars3 = chosen_dna.dna.GetUIValueRange(DNA_UI_EARS3_G,    255)
			var/bEars3 = chosen_dna.dna.GetUIValueRange(DNA_UI_EARS3_B,    255)

			
			H.dna.SetUIValueRange(DNA_UI_EARS_R,    rEars,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_EARS_G,    gEars,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_EARS_B,    bEars,    255,    1)

			H.dna.SetUIValueRange(DNA_UI_EARS2_R,   rEars2,   255,    1)
			H.dna.SetUIValueRange(DNA_UI_EARS2_G,   gEars2,   255,    1)
			H.dna.SetUIValueRange(DNA_UI_EARS2_B,   bEars2,   255,    1)

			H.dna.SetUIValueRange(DNA_UI_EARS3_R,   rEars3,   255,    1)
			H.dna.SetUIValueRange(DNA_UI_EARS3_G,   gEars3,   255,    1)
			H.dna.SetUIValueRange(DNA_UI_EARS3_B,   bEars3,   255,    1)

			H.r_ears = rEars
			H.g_ears = gEars
			H.b_ears = bEars
			H.r_ears2 = rEars2
			H.g_ears2 = gEars2
			H.b_ears2 = bEars2
			H.r_ears3 = rEars3
			H.g_ears3 = gEars3
			H.b_ears3 = bEars3

		if("hair")
			var/hair = chosen_dna.dna.GetUIValueRange(DNA_UI_HAIR_STYLE,hair_styles_list.len)
			if((0 < hair) && (hair <= hair_styles_list.len))
				H.dna.SetUIValueRange(DNA_UI_HAIR_STYLE,	hair,    hair_styles_list.len,  1)
				H.h_style = hair_styles_list[hair]
		if("hair color")
			var/rHair = chosen_dna.dna.GetUIValueRange(DNA_UI_HAIR_R,    255)
			var/gHair = chosen_dna.dna.GetUIValueRange(DNA_UI_HAIR_G,    255)
			var/bHair = chosen_dna.dna.GetUIValueRange(DNA_UI_HAIR_B,    255)

			H.dna.SetUIValueRange(DNA_UI_HAIR_R,    rHair,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_HAIR_G,    gHair,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_HAIR_B,    bHair,    255,    1)

			H.r_hair = rHair
			H.g_hair = gHair
			H.b_hair = bHair

		if("face")
			
			H.real_name = chosen_dna.name
			H.custom_say = chosen_dna.dna.custom_say
			H.custom_ask = chosen_dna.dna.custom_ask
			H.custom_whisper = chosen_dna.dna.custom_whisper
			H.custom_exclaim = chosen_dna.dna.custom_exclaim

			H.dna.custom_say = chosen_dna.dna.custom_say
			H.dna.custom_ask = chosen_dna.dna.custom_ask
			H.dna.custom_whisper = chosen_dna.dna.custom_whisper
			H.dna.custom_exclaim = chosen_dna.dna.custom_exclaim

		if("facial hair")
		if("facial hair color")
		if("body color")
		if("species")
		if("wings")
		if("wings color")
		if("tail")
		if("tail_color")
		if("gender")
		if("markings")

		if("all")
			if(ishuman(src))
				var/newSpecies = chosen_dna.speciesName
				H.set_species(newSpecies,1)

			src.dna = chosen_dna.dna.Clone()
			src.dna.b_type = "AB+" //This is needed to avoid blood rejection bugs.  The fact that the blood type might not match up w/ records could be a *FEATURE* too.

			if(ishuman(src))
				H.b_type = "AB+" //For some reason we have two blood types on the mob.
				H.identifying_gender = chosen_dna.identifying_gender
				H.flavor_texts = chosen_dna.flavour_texts ? chosen_dna.flavour_texts.Copy() : null
			src.real_name = chosen_dna.name
			
			sizeMult = chosen_dna.size_multiplier
			
			domutcheck(src, null)

	H.UpdateAppearance()
	H.resize(sizeMult, animate = FALSE)

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


