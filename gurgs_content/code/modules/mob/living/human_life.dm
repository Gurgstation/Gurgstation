// This belongs somewhere in human/life(). Good luck if this proc isn't in there. o7

/mob/living/carbon/human/proc/HandleBelches()
	if(nutrition > 500 && noisy_full == TRUE)
		var/belch_prob = 5 //Maximum belch prob.
		if(nutrition < 4075)
			belch_prob = ((nutrition-500)/3575)*5 //Scale belch prob with fullness if not already at max. If editing make sure the multiplier matches the max prob above.
		if(prob(belch_prob))
			var/sound/belchsound = sound(get_sfx("belches"))
			playsound(src, belchsound, vol = (20+(belch_prob*8)), vary = 1, falloff = 0.1, ignore_walls = TRUE, preference = /datum/client_preference/belch_noises)
			custom_emote(AUDIBLE_MESSAGE, "belches.") //Don't know if this should stay, I'll leave in in for now.
