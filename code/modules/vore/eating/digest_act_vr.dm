//Please make sure to:
//return FALSE: You are not going away, stop asking me to digest.
//return non-negative integer: Amount of nutrition/charge gained (scaled to nutrition, other end can multiply for charge scale).

// Ye default implementation.
/obj/item/proc/digest_act(atom/movable/item_storage = null)
	if(istype(item_storage, /obj/item/device/dogborg/sleeper))
		if(istype(src, /obj/item/device/pda))
			var/obj/item/device/pda/P = src
			if(P.id)
				P.id = null

		for(var/mob/living/voice/V in possessed_voice) // Delete voices.
			V.Destroy() //Destroy the voice.
		for(var/mob/living/M in contents)//Drop mobs from objects(shoes) before deletion
			M.forceMove(item_storage)
		for(var/obj/item/O in contents)
			if(istype(O, /obj/item/weapon/storage/internal)) //Dump contents from dummy pockets.
				for(var/obj/item/SO in O)
					if(item_storage)
						SO.forceMove(item_storage)
					qdel(O)
			else if(item_storage)
				O.forceMove(item_storage)
		GLOB.items_digested_roundstat++
		qdel(src)
		return w_class

	var/g_damage = 1
	if(digest_stage == null)
		digest_stage = w_class

	if(isbelly(item_storage))
		var/obj/belly/B = item_storage
		g_damage = 0.25 * (B.digest_brute + B.digest_burn)

	if(digest_stage > 0)
		if(g_damage > digest_stage)
			g_damage = digest_stage
		digest_stage -= g_damage
	if(digest_stage <= 0)
		if(istype(src, /obj/item/device/pda))
			var/obj/item/device/pda/P = src
			if(P.id)
				P.id = null
		for(var/mob/living/voice/V in possessed_voice) // Delete voices.
			V.Destroy() //Destroy the voice.
		for(var/mob/living/M in contents)//Drop mobs from objects(shoes) before deletion
			M.forceMove(item_storage)
		for(var/obj/item/O in contents)
			if(istype(O,/obj/item/weapon/storage/internal)) //Dump contents from dummy pockets.
				for(var/obj/item/SO in O)
					if(item_storage)
						SO.forceMove(item_storage)
					qdel(O)
			else if(item_storage)
				O.forceMove(item_storage)
		if(istype(src,/obj/item/stack))
			var/obj/item/stack/S = src
			if(S.get_amount() <= 1)
				qdel(src)
			else
				S.use(1)
				digest_stage = w_class
		else
			GLOB.items_digested_roundstat++
			qdel(src)
	if(g_damage > w_class)
		return w_class
	return g_damage

/////////////
// Some indigestible stuff
/////////////
/obj/item/weapon/hand_tele/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/device/aicard/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/device/paicard/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/gun/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/pinpointer/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/areaeditor/blueprints/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/disk/nuclear/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/device/perfect_tele_beacon/digest_act(var/atom/movable/item_storage = null)
	return FALSE //Sorta important to not digest your own beacons.
/obj/item/organ/internal/brain/slime/digest_act(var/atom/movable/item_storage = null)
	return FALSE //so prometheans can be recovered
/obj/item/weapon/circuitboard/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/tank/digest_act(var/atom/movable/item_storage = null)
	return FALSE //So you don't accidentally digest a oxygen tank
/obj/item/weapon/reagent_containers/syringe/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/grenade/digest_act(var/atom/movable/item_storage = null)
	return FALSE //Are you trying to explode?
/obj/item/weapon/storage/pill_bottle/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/implant/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/reagent_containers/hypospray/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/clothing/suit/radiation/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/clothing/head/radiation/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/clothing/suit/bio_suit/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/clothing/head/bio_hood/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/clothing/suit/space/digest_act(var/atom/movable/item_storage = null)
	return FALSE //You really shouldn't be digesting this
/obj/item/clothing/suit/bomb_suit/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/clothing/head/bomb_hood/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/rig/digest_act(var/atom/movable/item_storage = null)
	return FALSE //Seriously, don't digest this
/obj/item/clothing/suit/armor/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/clothing/head/helmet/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/shield/digest_act(var/atom/movable/item_storage = null)
	return FALSE //Alright big-mouth, spit it out
/obj/item/device/nif/digest_act(var/atom/movable/item_storage = null)
	return FALSE //I don't know why you would want to, just no
/obj/item/ammo_magazine/digest_act(var/atom/movable/item_storage = null)
	return FALSE //You really shouldn't digest ammo
/obj/item/weapon/surgical/digest_act(var/atom/movable/item_storage = null)
	return FALSE //Radar, where's my scalpel!?
/obj/item/stack/medical/digest_act(var/atom/movable/item_storage = null)
	return FALSE //What do you mean I can't digest gauze?
/obj/item/device/defib_kit/digest_act(var/atom/movable/item_storage = null)
	return FALSE //Why would you want to digest this?
/obj/item/weapon/storage/box/freezer/digest_act(var/atom/movable/item_storage = null)
	return FALSE //You don't get many of these, best to not digest it
/obj/item/device/perfect_tele/digest_act(var/atom/movable/item_storage = null)
	return FALSE //Like the handtele, but better. Don't digest this
/obj/item/clothing/gloves/arm_guard/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/clothing/shoes/leg_guard/digest_act(var/atom/movable/item_storage = null)
	return FALSE

/////////////
// Some special treatment
/////////////

/obj/item/weapon/card/id/digest_act(atom/movable/item_storage = null)
	desc = "A partially digested card that has seen better days. The damage appears to be only cosmetic."
	if(!sprite_stack || !istype(sprite_stack) || !(sprite_stack.len))
		icon = 'icons/obj/card_vr.dmi'
		icon_state = "[initial(icon_state)]_digested"
	else
		if(!sprite_stack.Find("digested"))
			sprite_stack += "digested"
	update_icon()
	return FALSE

/obj/item/weapon/reagent_containers/food/digest_act(atom/movable/item_storage = null)
	if(isbelly(item_storage))
		var/obj/belly/B = item_storage
		if(ishuman(B.owner))
			var/mob/living/carbon/human/H = B.owner
			reagents.trans_to_holder(H.ingested, (reagents.total_volume * 0.5), 1, 0)
		else if(isrobot(B.owner))
			var/mob/living/silicon/robot/R = B.owner
			R.cell.charge += 150
		qdel(src)
		return w_class
	. = ..()

/obj/item/weapon/holder/digest_act(atom/movable/item_storage = null)
	for(var/mob/living/M in contents)
		if(item_storage)
			M.forceMove(item_storage)
	held_mob = null

	. = ..()

/obj/item/organ/digest_act(atom/movable/item_storage = null)
	if((. = ..()))
		if(isbelly(item_storage))
			. *= 3
		else
			. += 30 //Organs give a little more

/obj/item/weapon/storage/digest_act(atom/movable/item_storage = null)
	for(var/obj/item/I in contents)
		I.screen_loc = null

	. = ..()

/////////////
// Some more complicated stuff
/////////////
/obj/item/device/mmi/digital/posibrain/digest_act(atom/movable/item_storage = null)
	//Replace this with a VORE setting so all types of posibrains can/can't be digested on a whim
	return FALSE

/obj/item/organ/internal/nano/digest_act(atom/movable/item_storage = null)
	//Make proteans recoverable too
	return FALSE

// Gradual damage measurement
/obj/item
	var/digest_stage = null
