//All of the custom gurg content for blobs attacking certain things

/obj/structure/flora/blob_act() //Blob munches the plant!
	if(prob(25))
		qdel(src) //Plants refuse to cooperate due to no take_damage proc, so we go nuclear
	playsound(src, 'sound/effects/attackblob.ogg', 50, 1)

	return ..()

/obj/machinery/power/port_gen/blob_act() //Port gens don't have health or damage max, so just blow it apart
	ex_act(2)
	playsound(src, 'sound/effects/attackblob.ogg', 50, 1)

/obj/structure/barricade/blob_act(var/obj/structure/blob/B) //Seems self-explanatory, beat on barricade until destroyed
	var/datum/blob_type/blob = B?.overmind?.blob_type
	var/damage = rand(blob.damage_lower, blob.damage_upper)
	src.take_damage(damage, blob.damage_type)
	playsound(src, 'sound/effects/attackblob.ogg', 50, 1)

	return ..()

/obj/machinery/atmospherics/unary/heater/blob_act() //I would just do unary in general, but then it eats vents and scrubbers
	ex_act(2)
	playsound(src, 'sound/effects/attackblob.ogg', 50, 1)

/obj/machinery/atmospherics/unary/freezer/blob_act()
	ex_act(2)
	playsound(src, 'sound/effects/attackblob.ogg', 50, 1)

/obj/machinery/power/smes/blob_act(var/obj/structure/blob/B) //Blob can eventually destroy SMES, given enough time. Generally causes very small explosion
	var/datum/blob_type/blob = B?.overmind?.blob_type
	var/damage = rand(blob.damage_lower, blob.damage_upper)
	src.take_damage(damage)
	playsound(src, 'sound/effects/attackblob.ogg', 50, 1)

	return ..()
