// Be sure to update planetary_vr.dm and atmosphers.dm when switching to this map.
/turf/simulated/open/triumph
	edge_blending_priority = 0.5 //Turfs which also have e_b_p and higher than this will plop decorative edges onto this turf

/turf/simulated/open/triumph/Initialize(mapload)
	. = ..()
	if(outdoors)
		SSplanets.addTurf(src)

/turf/simulated/floor/triumph_indoors
	TRIUMPH_SET_ATMOS

//Unsimulated
/turf/unsimulated/wall/planetary/triumph
	name = "facility wall"
	desc = "An eight-meter tall carbyne wall. For when the wildlife on your planet is mostly militant megacorps."
	alpha = 0xFF
	TRIUMPH_SET_ATMOS

/turf/unsimulated/mineral/triumph
	blocks_air = TRUE

/turf/unsimulated/floor/steel
	icon = 'icons/turf/flooring/tiles_vr.dmi'
	icon_state = "steel"


/turf/unsimulated/wall
	blocks_air = 1

/turf/unsimulated/wall/planetary
	blocks_air = 0

// Some turfs to make floors look better in centcom tram station.

/turf/unsimulated/floor/techfloor_grid
	name = "floor"
	icon = 'icons/turf/flooring/techfloor_vr.dmi'
	icon_state = "techfloor_grid"

/turf/unsimulated/floor/maglev
	name = "maglev track"
	desc = "Magnetic levitation tram tracks. Caution! Electrified!"
	icon = 'icons/turf/flooring/maglevs.dmi'
	icon_state = "maglevup"

/turf/unsimulated/wall/transit
	icon = 'icons/turf/transit_vr.dmi'

/turf/unsimulated/floor/transit
	icon = 'icons/turf/transit_vr.dmi'

/obj/effect/floor_decal/transit/orange
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "transit_techfloororange_edges"

/obj/effect/transit/light
	icon = 'icons/turf/transit_128.dmi'
	icon_state = "tube1-2"

// Bluespace jump turf!
/turf/space/bluespace
	name = "bluespace"
	icon = 'icons/turf/space_vr.dmi'
	icon_state = "bluespace"
/turf/space/bluespace/Initialize(mapload)
	. = ..()
	icon = 'icons/turf/space_vr.dmi'
	icon_state = "bluespace"

// Desert jump turf!
/turf/space/sandyscroll
	name = "sand transit"
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "desert_ns"
/turf/space/sandyscroll/Initialize(mapload)
	. = ..()
	icon_state = "desert_ns"

//Sky stuff!
// A simple turf to fake the appearance of flying.
/turf/simulated/sky/triumph
	color = "#FFBBBB"

/turf/simulated/sky/triumph/Initialize(mapload)
	SSplanets.addTurf(src)
	set_light(2, 2, "#FFBBBB")

/turf/simulated/sky/triumph/north
	dir = NORTH
/turf/simulated/sky/triumph/south
	dir = SOUTH
/turf/simulated/sky/triumph/east
	dir = EAST
/turf/simulated/sky/triumph/west
	dir = WEST

/turf/simulated/sky/triumph/moving
	icon_state = "sky_fast"
/turf/simulated/sky/triumph/moving/north
	dir = NORTH
/turf/simulated/sky/triumph/moving/south
	dir = SOUTH
/turf/simulated/sky/triumph/moving/east
	dir = EAST
/turf/simulated/sky/triumph/moving/west
	dir = WEST


/area/turbolift/t_ship/level1
	name = "Deck 1"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Engineering, Reactor, Telecomms, Trash Pit, Atmospherics"
	lift_announce_str = "Arriving at Deck 1."
	base_turf = /turf/simulated/floor/plating


/area/turbolift/t_ship/level2
	name = "Deck 2"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Dorms, Cargo, Mining, Bar, Cafe, Solars, Shops"
	lift_announce_str = "Arriving at Deck 2."

/area/turbolift/t_ship/level3
	name = "Deck 3"
	lift_floor_label = "Deck 3"
	lift_floor_name = "Medical, Science, Holo Deck, Teleporter"
	lift_announce_str = "Arriving at Deck 3."

/area/turbolift/t_ship/level4
	name = "Deck 4"
	lift_floor_label = "Deck 4"
	lift_floor_name = "Exploration, Arrivals & Departures, Security, Command, Chapel, Sauna, Docking Arm, Library, Garden, Tool Storage"
	lift_announce_str = "Arriving at Deck 4."


/area/holodeck/holodorm/source_basic
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE

/area/holodeck/holodorm/source_desert
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE

/area/holodeck/holodorm/source_seating
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE

/area/holodeck/holodorm/source_beach
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE

/area/holodeck/holodorm/source_garden
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE

/area/holodeck/holodorm/source_boxing
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE

/area/holodeck/holodorm/source_snow
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE

/area/holodeck/holodorm/source_space
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE

/area/holodeck/holodorm/source_off
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE

/area/crew_quarters/sleep/Dorm_1/holo
	name = "\improper Dorm 1 Holodeck"
	icon_state = "dk_yellow"

/area/crew_quarters/sleep/Dorm_3/holo
	name = "\improper Dorm 3 Holodeck"
	icon_state = "dk_yellow"

/area/crew_quarters/sleep/Dorm_5/holo
	name = "\improper Dorm 5 Holodeck"
	icon_state = "dk_yellow"

/area/crew_quarters/sleep/Dorm_7/holo
	name = "\improper Dorm 7 Holodeck"
	icon_state = "dk_yellow"