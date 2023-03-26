/obj/item/ammo_casing/microbattery/medical/brute/nerf
	name = "\'ML-3/M\' nanite cell - BRUTE-"
	type_color = "#BF0000"
	type_name = "<span style='color:#BF0000;font-weight:bold;'>BRUTE</span>"
	projectile_type = /obj/item/projectile/beam/medical_cell/brute

/obj/item/projectile/beam/medical_cell/brute/nerf/on_hit(var/mob/living/carbon/human/target)
	if(istype(target, /mob/living/carbon/human))
		if(target.stat != DEAD)
			target.adjustBruteLoss(-5)
	else
		return 1

/obj/item/ammo_casing/microbattery/medical/burn/nerf
	name = "\'ML-3/M\' nanite cell - BURN-"
	type_color = "#FF8000"
	type_name = "<span style='color:#FF8000;font-weight:bold;'>BURN</span>"
	projectile_type = /obj/item/projectile/beam/medical_cell/burn

/obj/item/projectile/beam/medical_cell/burn/nerf/on_hit(var/mob/living/carbon/human/target)
	if(istype(target, /mob/living/carbon/human))
		if(target.stat != DEAD)
			target.adjustFireLoss(-5)
	else
		return 1

/obj/item/ammo_casing/microbattery/medical/toxin/nerf
	name = "\'ML-3/M\' nanite cell - TOXIN"
	type_color = "#00A000"
	type_name = "<span style='color:#00A000;font-weight:bold;'>TOXIN</span>"
	projectile_type = /obj/item/projectile/beam/medical_cell/toxin

/obj/item/projectile/beam/medical_cell/toxin/nerf/on_hit(var/mob/living/carbon/human/target)
	if(istype(target, /mob/living/carbon/human))
		if(target.stat != DEAD)
			target.adjustToxLoss(-5)
	else
		return 1
