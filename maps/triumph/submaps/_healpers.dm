//Acts like the map edge, can use this to divide up zlevels into 'fake' multiz areas.
//Keep in mind that the entire zlevel 'moves' when the ship does, so don't try to make DIFFERENT ships share a zlevel.
/turf/space/internal_edge
	icon_state = "arrow"
	opacity = 1
	blocks_air = TRUE

/turf/space/internal_edge/top
	dir = NORTH
	forced_dirs = NORTH
/turf/space/internal_edge/bottom
	dir = SOUTH
	forced_dirs = SOUTH
/turf/space/internal_edge/left
	dir = WEST
	forced_dirs = WEST
/turf/space/internal_edge/right
	dir = EAST
	forced_dirs = EAST
/turf/space/internal_edge/topleft
	dir = NORTHWEST
	forced_dirs = NORTHWEST
/turf/space/internal_edge/topright
	dir = NORTHEAST
	forced_dirs = NORTHEAST
/turf/space/internal_edge/bottomleft
	dir = SOUTHWEST
	forced_dirs = SOUTHWEST
/turf/space/internal_edge/bottomright
	dir = SOUTHEAST
	forced_dirs = SOUTHEAST
