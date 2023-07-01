/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/boomstick //Gurg add : Mecha infantry shotgun
	name = "\improper Liandri G-13 \"Boomstick\""
	desc = "A mech-mounted infantry shotgun designed with versatility in mind. Comes with a integrated ammo-lathe."
	icon = 'icons/mecha/mecha_equipment_gg.dmi'
	icon_state = "mecha_boomstick"
	equip_cooldown = 15
	var/mode = 0 //0 - buckshot, 1 - beanbag, 2 - slug, 3 - Dragonsbreath.
	projectile = /obj/item/projectile/scatter/shotgun
	fire_sound = 'sound/weapons/Gunshot_shotgun.ogg'
	fire_volume = 80
	projectiles = 6
	projectiles_per_shot = 1
	deviation = 0.7
	projectile_energy_cost = 75 //More power use then most ballistics, due to versatile ammo lathe
	equip_type = EQUIP_WEAPON
	required_type = list(/obj/mecha/combat)

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/boomstick/Topic(href,href_list)
	..()
	if(href_list["mode"])
		mode = text2num(href_list["mode"])
		switch(mode)
			if(0)
				occupant_message("Now firing buckshot.")
				projectile = /obj/item/projectile/scatter/shotgun // Use scatter/shotgun over bullet/pellet/shotgun for multiple projectiles
			if(1)
				occupant_message("Now firing beanbags.")
				projectile = /obj/item/projectile/bullet/pistol/rubber/strong //I know what you're thinking, why not beanbag? Strong Rubber has a lower chance of accidentally killing someone
			if(2)
				occupant_message("Now firing slugs.")
				projectile = /obj/item/projectile/bullet/shotgun
			if(3)
				occupant_message("Now firing dragonsbreath")
				projectile = /obj/item/projectile/scatter/flamethrower //This is probably a bad idea

	return

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/boomstick/get_equip_info()
	return "[..()] \[<a href='?src=\ref[src];mode=0'>BS</a>|<a href='?src=\ref[src];mode=1'>BB</a>|<a href='?src=\ref[src];mode=2'>S</a>|<a href='?src=\ref[src];mode=3'>DB</a>\]"
