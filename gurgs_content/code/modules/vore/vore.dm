/datum/vore_preferences
	var/latejoin_vore = FALSE

// spawnpoint for vore bellies, putting here cause it's VORE!
/datum/spawnpoint/vore
	display_name = "Vore Belly"
	msg = "has arrived on the station"

/datum/spawnpoint/vore/New()
	..()
	turfs = latejoin