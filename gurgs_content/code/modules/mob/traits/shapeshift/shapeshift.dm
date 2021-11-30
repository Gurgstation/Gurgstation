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

//	var/preyDNA = owner.GetAbsorbedDNA(L.real_name)
//	if(preyDNA)
//		owner.absorbedPreys -= preyDNA

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

/datum/absorbed_dna
	var/custom_species

	var/r_grad
	var/g_grad
	var/b_grad
	var/grad_style


/datum/absorbed_dna/proc/SetupExtras(var/mob/living/M, var/datum/absorbed_dna/new_dna)
	new_dna.size_multiplier = M.size_multiplier
	
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		custom_species = H.custom_species

		r_grad = H.r_grad
		g_grad = H.g_grad
		b_grad = H.b_grad
		grad_style = H.grad_style



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

	var/list/partlist = list("ears", "ears color","hair", "hair color", "face", "facial hair", "facial hair color", "body color", "species", "wings", "wings color", "tail", "tail color", "gender", "markings", "size", "all")
	var/chosenPart = tgui_input_list(usr, "Select part:", "Poggers", partlist)
	
	if(chosenPart)
		src.transform_part(chosenPart, chosen_dna)
		src.visible_message("<span class='warning'>[src] transforms!</span>")	
		
		src?.dna.UpdateUI()
		src.UpdateAppearance()

	
	// Ooooh! That's a clever way to do a cooldown!
	src.verbs -= /mob/living/proc/prey_transform
	spawn(10)
		src.verbs += /mob/living/proc/prey_transform
		src.regenerate_icons()

	return 1

/mob/living/proc/transform_part(var/part, var/datum/absorbed_dna/chosen_dna, var/all = 0)
	if(!part)	return
	if(!ishuman(src))	return

	var/mob/living/carbon/human/H = src

	var/sizeMult = H.size_multiplier

	switch(part)
		if("species")
			var/newSpecies = chosen_dna.speciesName
			H.shapeshift_change_species(newSpecies)
			H.custom_species = chosen_dna.custom_species
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

			H.r_grad = chosen_dna.r_grad
			H.g_grad = chosen_dna.g_grad
			H.b_grad = chosen_dna.b_grad
			H.grad_style = chosen_dna.grad_style

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
			var/beard = chosen_dna.dna.GetUIValueRange(DNA_UI_BEARD_STYLE,facial_hair_styles_list.len)
			if((0 < beard) && (beard <= facial_hair_styles_list.len))
				H.dna.SetUIValueRange(DNA_UI_BEARD_STYLE,	beard,    facial_hair_styles_list.len,  1)
				H.f_style = facial_hair_styles_list[beard]

		if("facial hair color")

			var/rFHair = chosen_dna.dna.GetUIValueRange(DNA_UI_BEARD_R,    255)
			var/gFHair = chosen_dna.dna.GetUIValueRange(DNA_UI_BEARD_G,    255)
			var/bFHair = chosen_dna.dna.GetUIValueRange(DNA_UI_BEARD_B,    255)

			H.dna.SetUIValueRange(DNA_UI_BEARD_R,    rFHair,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_BEARD_G,    gFHair,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_BEARD_B,    bFHair,    255,    1)

			H.r_facial = rFHair
			H.g_facial = gFHair
			H.b_facial = bFHair

		if("body color")	
		
			var/rSkin = chosen_dna.dna.GetUIValueRange(DNA_UI_SKIN_R,    255)
			var/gSkin = chosen_dna.dna.GetUIValueRange(DNA_UI_SKIN_G,    255)
			var/bSkin = chosen_dna.dna.GetUIValueRange(DNA_UI_SKIN_B,    255)

			H.dna.SetUIValueRange(DNA_UI_SKIN_R,    rSkin,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_SKIN_G,    gSkin,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_SKIN_B,    bSkin,    255,    1)

			H.r_skin   = rSkin
			H.g_skin   = gSkin
			H.b_skin   = bSkin

		if("wings")
			var/wing = chosen_dna.dna.GetUIValueRange(DNA_UI_WING_STYLE, wing_styles_list.len + 1) - 1
			if(wing < 1)
				H.wing_style = null
			if((0 < wing) && (wing <= wing_styles_list.len))
				H.dna.SetUIValueRange(DNA_UI_WING_STYLE,	wing + 1,    wing_styles_list.len + 1,  1)
				H.wing_style = wing_styles_list[wing_styles_list[wing]]

		if("wings color")
			var/rWing   = chosen_dna.dna.GetUIValueRange(DNA_UI_WING_R,    255)
			var/gWing   = chosen_dna.dna.GetUIValueRange(DNA_UI_WING_G,    255)
			var/bWing   = chosen_dna.dna.GetUIValueRange(DNA_UI_WING_B,    255)
			var/rWing2  = chosen_dna.dna.GetUIValueRange(DNA_UI_WING2_R,    255)
			var/gWing2  = chosen_dna.dna.GetUIValueRange(DNA_UI_WING2_G,    255)
			var/bWing2  = chosen_dna.dna.GetUIValueRange(DNA_UI_WING2_B,    255)
			var/rWing3  = chosen_dna.dna.GetUIValueRange(DNA_UI_WING3_R,    255)
			var/gWing3  = chosen_dna.dna.GetUIValueRange(DNA_UI_WING3_G,    255)
			var/bWing3  = chosen_dna.dna.GetUIValueRange(DNA_UI_WING3_B,    255)
			
			H.dna.SetUIValueRange(DNA_UI_WING_R,    rWing,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_WING_G,    gWing,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_WING_B,    bWing,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_WING2_R,    rWing2,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_WING2_G,    gWing2,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_WING2_B,    bWing2,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_WING3_R,    rWing3,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_WING3_G,    gWing3,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_WING3_B,    bWing3,    255,    1)

			H.r_wing = rWing
			H.g_wing = gWing
			H.b_wing = bWing
			H.r_wing2 = rWing2
			H.g_wing2 = gWing2
			H.b_wing2 = bWing2
			H.r_wing3 = rWing3
			H.g_wing3 = gWing3
			H.b_wing3 = bWing3

		if("tail")
			var/tail = chosen_dna.dna.GetUIValueRange(DNA_UI_TAIL_STYLE, tail_styles_list.len + 1) - 1
			if((0 < tail) && (tail <= tail_styles_list.len))
				H.dna.SetUIValueRange(DNA_UI_TAIL_STYLE,	tail + 1,    tail_styles_list.len + 1,  1)
				H.tail_style = tail_styles_list[tail_styles_list[tail]]

		if("tail color")
			var/rTail   = dna.GetUIValueRange(DNA_UI_TAIL_R,    255)
			var/gTail   = dna.GetUIValueRange(DNA_UI_TAIL_G,    255)
			var/bTail   = dna.GetUIValueRange(DNA_UI_TAIL_B,    255)
			var/rTail2  = dna.GetUIValueRange(DNA_UI_TAIL2_R,   255)
			var/gTail2  = dna.GetUIValueRange(DNA_UI_TAIL2_G,   255)
			var/bTail2  = dna.GetUIValueRange(DNA_UI_TAIL2_B,   255)
			var/rTail3  = dna.GetUIValueRange(DNA_UI_TAIL3_R,   255)
			var/gTail3  = dna.GetUIValueRange(DNA_UI_TAIL3_G,   255)
			var/bTail3  = dna.GetUIValueRange(DNA_UI_TAIL3_B,   255)

			H.dna.SetUIValueRange(DNA_UI_TAIL_R,    rTail,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_TAIL_G,    gTail,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_TAIL_B,    bTail,    255,    1)
			H.dna.SetUIValueRange(DNA_UI_TAIL2_R,   rTail2,   255,    1)
			H.dna.SetUIValueRange(DNA_UI_TAIL2_G,   gTail2,   255,    1)
			H.dna.SetUIValueRange(DNA_UI_TAIL2_B,   bTail2,   255,    1)
			H.dna.SetUIValueRange(DNA_UI_TAIL3_R,   rTail3,   255,    1)
			H.dna.SetUIValueRange(DNA_UI_TAIL3_G,   gTail3,   255,    1)
			H.dna.SetUIValueRange(DNA_UI_TAIL3_B,   bTail3,   255,    1)

			H.r_tail = rTail
			H.g_tail = gTail
			H.b_tail = bTail
			H.r_tail2 = rTail2
			H.g_tail2 = gTail2
			H.b_tail2 = bTail2
			H.r_tail3 = rTail3
			H.g_tail3 = gTail3
			H.b_tail3 = bTail3

		if("gender")
			H.identifying_gender = chosen_dna.identifying_gender

		if("markings") // Experimental, not working the best, need to work out the kinks with it, gonna take some more time.
			if(all)
				H.dna.body_markings.Cut()
				for(var/tag in chosen_dna.dna.body_markings) 
					var/obj/item/organ/external/E = H.organs_by_name[tag]
					if(E)
						var/list/marklist = chosen_dna.dna.body_markings[tag]
						H.dna.body_markings[tag] = marklist.Copy()
						E.markings = marklist.Copy()
			else
				var/selection = tgui_input_list(H, "Select markings:", "Ass blast USA", chosen_dna.dna.body_markings + "all")

				if(selection)
					if(selection == "all")
						H.transform_part("markings", chosen_dna, 1)
					var/obj/item/organ/external/E = H.organs_by_name[selection]
					var/chosenMarking = tgui_input_list(H, "Select markings:", "Ass blast USA", chosen_dna.dna.body_markings[selection])
					if(chosenMarking)
						var/mark = chosen_dna.dna.body_markings[chosenMarking]
						H.dna.body_markings[chosenMarking] |= mark
						E.markings |= mark

		if("size")
			var/size = chosen_dna.dna.GetUIValueRange(DNA_UI_PLAYERSCALE, player_sizes_list.len)
			H.dna.SetUIValueRange(DNA_UI_PLAYERSCALE, size, player_sizes_list.len, 1)

			sizeMult = size
		if("all")
			var/list/partlist = list("ears", "ears color","hair", "hair color", "face", "facial hair", "facial hair color", "body color", "species", "wings", "wings color", "tail", "tail color", "gender", "markings", "size") // TODO: Refactor this

			for(var/i in partlist)
				H.transform_part(i, chosen_dna, 1)

			H.b_type = "AB+" //For some reason we have two blood types on the mob.
			H.identifying_gender = chosen_dna.identifying_gender
			H.flavor_texts = chosen_dna.flavour_texts ? chosen_dna.flavour_texts.Copy() : null

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

/mob/living/proc/remove_markings()
	set category = "Abilities"
	set name = "Remove Markings"

	if(!ishuman(src))	return

	var/mob/living/carbon/human/H = src
	var/size = H.size_multiplier
	var/selection = tgui_input_list(H, "Select markings:", "Ass blast USA", H.dna.body_markings)

	if(selection)
		var/obj/item/organ/external/E = H.organs_by_name[selection]
		var/chosenMarking = tgui_input_list(H, "Select markings:", "Ass blast USA", H.dna.body_markings[selection])
		if(chosenMarking)
			var/mark = H.dna.body_markings[chosenMarking]
			H.dna.body_markings[chosenMarking] -= mark
			E.markings -= mark

	H.UpdateAppearance()
	H.resize(size, FALSE)

/mob/living/carbon/proc/shapeshift_change_species(var/new_species) // This is a copy of the species_shapeshift.dm version, however catered to this instead. 

	var/list/limb_exists = list(
		BP_TORSO =  0,
		BP_GROIN =  0,
		BP_HEAD =   0,
		BP_L_ARM =  0,
		BP_R_ARM =  0,
		BP_L_LEG =  0,
		BP_R_LEG =  0,
		BP_L_HAND = 0,
		BP_R_HAND = 0,
		BP_L_FOOT = 0,
		BP_R_FOOT = 0
		)
	var/list/wounds_by_limb = list(
		BP_TORSO =  new/list(),
		BP_GROIN =  new/list(),
		BP_HEAD =   new/list(),
		BP_L_ARM =  new/list(),
		BP_R_ARM =  new/list(),
		BP_L_LEG =  new/list(),
		BP_R_LEG =  new/list(),
		BP_L_HAND = new/list(),
		BP_R_HAND = new/list(),
		BP_L_FOOT = new/list(),
		BP_R_FOOT = new/list()
		)

	// Copy damage values
	for(var/limb in organs_by_name)
		var/obj/item/organ/external/O = organs_by_name[limb]
		limb_exists[O.organ_tag] = 1
		wounds_by_limb[O.organ_tag] = O.wounds

	species = GLOB.all_species[new_species]
	species.create_organs(src)
//	species.handle_post_spawn(src)

	for(var/limb in organs_by_name)
		var/obj/item/organ/external/O = organs_by_name[limb]
		if(limb_exists[O.organ_tag])
			O.species = GLOB.all_species[new_species]
			O.wounds = wounds_by_limb[O.organ_tag]
			// sync the organ's damage with its wounds
			O.update_damages()
			O.owner.updatehealth() //droplimb will call updatehealth() again if it does end up being called
		else
			organs.Remove(O)
			organs_by_name.Remove(O)
			qdel(O)

	regenerate_icons()
/* VOREStation Edit - Our own trait system, sorry.
	if(species && mind)
		apply_traits()
*/
	return
