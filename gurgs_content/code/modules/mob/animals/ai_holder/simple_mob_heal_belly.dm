/datum/ai_holder/simple_mob/healbelly
	intelligence_level = 3
	can_breakthrough = 0
	var/vocal = 1
	var/last_speak

/datum/ai_holder/simple_mob/healbelly/retaliate
	retaliate = 1

/datum/ai_holder/simple_mob/healbelly/proc/confirmPatient(var/mob/living/P)
	if(istype(holder,/mob/living/simple_mob))
		var/mob/living/simple_mob/H = holder
		if(H.will_eat(P))
			if(issilicon(P))
				return
			if(iscarbon(P))
				if(P.isSynthetic()) //Sorry robits
					return
			else
				if(!P.client)	//Don't target simple mobs that aren't player controlled
					return
			if(P.stat == DEAD)
				return
			if(P.suiciding)
				return
			if(P.health <= (P.maxHealth * 0.95))	//Nom em'
				if(vocal)
					if(last_speak + 30 SECONDS < world.time)
						var/message_options = list(
							"Hey, [P.name]! You are injured, hold still.",
							"[P.name]! Come here, let me help.",
							"[P.name], you need help."
							)
						var/message = pick(message_options)
						H.say(message)
						last_speak = world.time
					return 1

//Attack overrides to let us """Attack""" allies and heal them
/datum/ai_holder/simple_mob/healbelly/can_attack(atom/movable/the_target, vision_required = 1)
	if(!can_see_target(the_target) && vision_required)
		return

	if(isliving(the_target))
		var/mob/living/L = the_target
		if(ishuman(L) || issilicon(L))
			if(!L.client)	// SSD players get a pass
				return
		if(L.stat)
			if(L.stat == DEAD && !handle_corpse) // Leave dead things alone
				return
		if(holder.IIsAlly(L))
			if(confirmPatient(L))
				holder.a_intent = I_HELP
				return 1
			else
				return 0
	holder.a_intent = I_HURT
	return 1

/datum/ai_holder/simple_mob/healbelly/melee_attack(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(holder.a_intent == I_HELP)
			var/mob/living/simple_mob/H = holder
			if(H.will_eat(L))
				H.PounceTarget(L)
				//The following is some reagent injections to cover our bases, since being swallowed and dying from internal injuries sucks
				//If this ends up being op because medbay gets replaced by a voremob buckled to a chair, feel free to remove some.
				//Alternatively bully a coder (me) to make a unique digest_mode for mob healbellies that prevents death, or something.
				if(istype(A, /mob/living/carbon/human))
					var/mob/living/carbon/human/P = L
					var/list/to_inject = list("myelamine","osteodaxon","spaceacillin","peridaxon", "iron", "hyronalin")
					//Lets not OD them...
					for(var/RG in to_inject)
						if(!P.reagents.has_reagent(RG))
							P.reagents.add_reagent(RG, 10)
				L.ExtinguishMob()
			return //Don't attack people if we're on help intent
	return .=..()
