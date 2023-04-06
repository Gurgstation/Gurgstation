/obj/item/weapon/storage/secure/briefcase/ml3m_pack_cmo/nerfed
	name = "\improper ML-3 \'Medigun\' kit"
	desc = "A storage case for a multi-purpose healing gun. Variety hour!"
	icon_state = "medbriefcase"
	w_class = ITEMSIZE_NORMAL
	max_w_class = ITEMSIZE_NORMAL
	can_hold = list(/obj/item/weapon/gun/projectile/cell_loaded/medical,/obj/item/ammo_magazine/cell_mag/medical,/obj/item/ammo_casing/microbattery/medical)

/obj/item/weapon/storage/secure/briefcase/ml3m_pack_cmo/nerfed/New()
	new /obj/item/weapon/gun/projectile/cell_loaded/medical(src)
	new /obj/item/ammo_magazine/cell_mag/medical(src)
	new /obj/item/ammo_casing/microbattery/medical/omni(src)
	new /obj/item/ammo_casing/microbattery/medical/omni(src)
