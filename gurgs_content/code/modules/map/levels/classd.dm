/*/datum/atmosphere/planet/classd
	base_gases = list(,
	/datum/gas/carbon_dioxide = 1
	)
	base_target_pressure = 10
	minimum_pressure = 0.1
	maximum_pressure = 100
	minimum_temp = 183
	maximum_temp = 203
*/
// -- Datums -- //

/obj/effect/overmap/visitable/sector/classd
	name = "Class D"
	desc = "Honestly idk what to say, other than POGGERS."
	scanner_desc = @{"[i]Stellar Body[/i]: Class D
[i]Class[/i]: D-Class Planet
[i]Habitability[/i]: dunno fam
[b]Notice[/b]: Mining map pog"}
	icon_state = "globe"
	in_space = 0
//	initial_generic_waypoints = list("beach_e", "beach_c", "beach_nw")
//	extra_z_levels = list()
	known = TRUE
	icon_state = "desert"

//This is a special subtype of the thing that generates ores on a map
//It will generate more rich ores because of the lower numbers than the normal one
/datum/random_map/noise/ore/classd
	descriptor = "Class D mine ore distribution map"
	deep_val = 0.6 //More riches, normal is 0.7 and 0.8
	rare_val = 0.5

//The check_map_sanity proc is sometimes unsatisfied with how AMAZING our ores are
/datum/random_map/noise/ore/classd/check_map_sanity()
	var/rare_count = 0
	var/surface_count = 0
	var/deep_count = 0

	// Increment map sanity counters.
	for(var/value in map)
		if(value < rare_val)
			surface_count++
		else if(value < deep_val)
			rare_count++
		else
			deep_count++
	// Sanity check.
	if(surface_count < 100)
		admin_notice("<span class='danger'>Insufficient surface minerals. Rerolling...</span>", R_DEBUG)
		return 0
	else if(rare_count < 50)
		admin_notice("<span class='danger'>Insufficient rare minerals. Rerolling...</span>", R_DEBUG)
		return 0
	else if(deep_count < 50)
		admin_notice("<span class='danger'>Insufficient deep minerals. Rerolling...</span>", R_DEBUG)
		return 0
	else
		return 1