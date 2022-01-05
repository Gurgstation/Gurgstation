// Turfs

/turf/simulated/floor/beach/sand/outdoors/lowdesert
	name = "\improper low desert"
	icon = 'icons/turf/desert.dmi'
	icon_state = "lowdesert"

/turf/simulated/floor/outdoors/beach/outdoors/sand/lowdesert/Initialize(mapload)
	. = ..()
	if(prob(5))
		icon_state = "lowdesert[rand(0,4)]"

/turf/simulated/floor/beach/sand/dirt
	name = "worn out path"
	desc = "A compacted bit of sand with footprints all over it..."
	icon_state = "dirt-dark"
	icon = 'icons/turf/outdoors.dmi'

/turf/simulated/floor/beach/sand/outdoors/dirtlight
	name = "sun bleached path"
	desc = "A cracked path of compacted sand, worn by heavy traffic and bleached by constant sunlight."
	icon_state = "dirt-light"
	icon = 'icons/turf/outdoors.dmi'


// Literally random fucking shit

/obj/random/triumph
	name = "random triumph loot"
	icon = 'icons/obj/items.dmi'
	icon_state = "spickaxe"

/obj/random/triumph/item_to_spawn()
	return pick(prob(3);/obj/random/multiple/miningdrills,
				prob(3);/obj/random/multiple/ores,
				prob(2);/obj/random/multiple/treasure,
				prob(1);/obj/random/multiple/mechtool)

/obj/random/triumph/uncertain
	icon_state = "upickaxe"
	spawn_nothing_percentage = 65	//only 33% to spawn loot


/obj/random/multiple/miningdrills
	name = "random mining tool loot"
	icon = 'icons/obj/items.dmi'
	icon_state = "spickaxe"

/obj/random/multiple/miningdrills/item_to_spawn()
	return pick(
				prob(10);list(/obj/item/weapon/pickaxe/silver),
				prob(8);list(/obj/item/weapon/pickaxe/drill),
				prob(6);list(/obj/item/weapon/pickaxe/jackhammer),
				prob(5);list(/obj/item/weapon/pickaxe/gold),
				prob(4);list(/obj/item/weapon/pickaxe/plasmacutter),
				prob(2);list(/obj/item/weapon/pickaxe/diamond),
				prob(1);list(/obj/item/weapon/pickaxe/diamonddrill)
				)

/obj/random/multiple/ores
	name = "random mining ore loot"
	icon = 'icons/obj/mining.dmi'
	icon_state = "satchel"

/obj/random/multiple/ores/item_to_spawn()
	return pick(
				prob(9);list(
							/obj/item/weapon/storage/bag/ore,
							/obj/item/weapon/shovel,
							/obj/item/weapon/ore/glass,
							/obj/item/weapon/ore/glass,
							/obj/item/weapon/ore/glass,
							/obj/item/weapon/ore/glass,
							/obj/item/weapon/ore/glass,
							/obj/item/weapon/ore/glass,
							/obj/item/weapon/ore/glass,
							/obj/item/weapon/ore/glass,
							/obj/item/weapon/ore/glass,
							/obj/item/weapon/ore/glass,
							/obj/item/weapon/ore/hydrogen,
							/obj/item/weapon/ore/hydrogen,
							/obj/item/weapon/ore/hydrogen,
							/obj/item/weapon/ore/hydrogen,
							/obj/item/weapon/ore/hydrogen,
							/obj/item/weapon/ore/hydrogen
							),
				prob(7);list(
							/obj/item/weapon/storage/bag/ore,
							/obj/item/weapon/pickaxe,
							/obj/item/weapon/ore/osmium,
							/obj/item/weapon/ore/osmium,
							/obj/item/weapon/ore/osmium,
							/obj/item/weapon/ore/osmium,
							/obj/item/weapon/ore/osmium,
							/obj/item/weapon/ore/osmium,
							/obj/item/weapon/ore/osmium,
							/obj/item/weapon/ore/osmium,
							/obj/item/weapon/ore/osmium,
							/obj/item/weapon/ore/osmium
							),
				prob(4);list(
							/obj/item/clothing/suit/radiation,
							/obj/item/clothing/head/radiation,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium,
							/obj/item/weapon/ore/uranium),
				prob(2);list(
							/obj/item/device/flashlight/lantern,
							/obj/item/clothing/glasses/material,
							/obj/item/weapon/ore/diamond,
							/obj/item/weapon/ore/diamond,
							/obj/item/weapon/ore/diamond,
							/obj/item/weapon/ore/diamond,
							/obj/item/weapon/ore/diamond,
							/obj/item/weapon/ore/diamond,
							/obj/item/weapon/ore/diamond,
							/obj/item/weapon/ore/diamond,
							/obj/item/weapon/ore/diamond,
							/obj/item/weapon/ore/diamond
							),
				prob(1);list(
							/obj/item/weapon/mining_scanner,
							/obj/item/weapon/shovel/spade,
							/obj/item/weapon/ore/verdantium,
							/obj/item/weapon/ore/verdantium,
							/obj/item/weapon/ore/verdantium,
							/obj/item/weapon/ore/verdantium,
							/obj/item/weapon/ore/verdantium
							)
				)

/obj/random/multiple/treasure
	name = "random treasure"
	icon = 'icons/obj/storage.dmi'
	icon_state = "cashbag"

/obj/random/multiple/treasure/item_to_spawn()
	return pick(
				prob(5);list(
							/obj/random/coin,
							/obj/random/coin,
							/obj/random/coin,
							/obj/random/coin,
							/obj/random/coin,
							/obj/item/clothing/head/pirate
							),
				prob(4);list(
							/obj/item/weapon/storage/bag/cash,
							/obj/item/weapon/spacecash/c500,
							/obj/item/weapon/spacecash/c100,
							/obj/item/weapon/spacecash/c50
							),
				prob(3);list(
							/obj/item/clothing/head/hardhat/orange,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold),
				prob(1);list(
							/obj/item/stack/material/phoron,
							/obj/item/stack/material/phoron,
							/obj/item/stack/material/phoron,
							/obj/item/stack/material/phoron,
							/obj/item/stack/material/diamond,
							/obj/item/stack/material/diamond,
							/obj/item/stack/material/diamond
							)
				)

/obj/random/multiple/mechtool
	name = "random mech equipment"
	icon = 'icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_clamp"

/obj/random/multiple/mechtool/item_to_spawn()
	return pick(
				prob(12);list(/obj/item/mecha_parts/mecha_equipment/tool/drill),
				prob(10);list(/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp),
				prob(8);list(/obj/item/mecha_parts/mecha_equipment/generator),
				prob(7);list(/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot/rigged),
				prob(6);list(/obj/item/mecha_parts/mecha_equipment/repair_droid),
				prob(3);list(/obj/item/mecha_parts/mecha_equipment/gravcatapult),
				prob(2);list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/riggedlaser),
				prob(2);list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/flamer/rigged),
				prob(1);list(/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill),
				)