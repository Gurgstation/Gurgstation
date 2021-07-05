// Just a place to put any variables used for map.dm

/datum/map
	// Gurgs ADD: Spawnable Belees
	// Make sure this code is in map_z_level/New():
	// if(flags & MAP_LEVEL_VORESPAWN) map.vorespawn_levels += z
	
	var/static/list/vorespawn_levels = list() //Z-levels where players are allowed to vore latejoin to.