// Mostly based off of chomper's additional mobs however refactorised into it's own file.
// No code outside of this is used, if you'd wish to add anymore mobs to the list use this c: Though be warned that if you add duplicates it will double the chance.

/obj/structure/ghost_pod/ghost_activated/maintpred
	var/list/gurgs_additional_mobs = list(
								"Chubby Otie" = /mob/living/simple_mob/otie/friendly/chubby,//CHOMPedit: more mobs
								"Chubby Mutated Otie" = /mob/living/simple_mob/otie/feral/chubby,//CHOMPedit: more mobs
								"Chubby Red Otie" = /mob/living/simple_mob/otie/red/chubby,//CHOMPedit: more mobs
								"Zorgoia" = /mob/living/simple_mob/otie/zorgoia,//CHOMPedit: more mobs
								"Dire Wolf" = /mob/living/simple_mob/animal/wolf/direwolf,//CHOMPedit: more mobs
								"Large Dog" = /mob/living/simple_mob/animal/wolf/direwolf/dog,//CHOMPedit: more mobs
								"Hyena" = /mob/living/simple_mob/animal/hyena,//CHOMPedit: more mobs
								"Lizardman" = /mob/living/simple_mob/vore/aggressive/lizardman,//CHOMPedit: more mobs
								"Fox" = /mob/living/simple_mob/animal/passive/fox,//CHOMPedit: more mobs
								"Syndi-Fox" = /mob/living/simple_mob/animal/passive/fox/syndicate,//CHOMPedit: more mobs
								"Raccoon" = /mob/living/simple_mob/animal/passive/raccoon_ch,//CHOMPedit: more mobs
								"Cat" = /mob/living/simple_mob/animal/passive/cat//CHOMPedit: more mobs
	)

/obj/structure/ghost_pod/ghost_activated/maintpred/create_occupant(var/mob/M)
	possible_mobs += gurgs_additional_mobs
	..()
