//Atmosphere properties
#define FROZEN_PLANET_ATMOSPHERE	100.0 //kPa
#define FROZEN_PLANET_AVG_TEMP	265.5 //kelvin

#define FROZEN_PLANET_PER_N2			0.77 //percent
#define FROZEN_PLANET_PER_O2			0.23
#define FROZEN_PLANET_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define FROZEN_PLANET_PER_CO2		0.00
#define FROZEN_PLANET_PER_PHORON		0.00

//Math only beyond this point
#define FROZEN_PLANET_MOL_PER_TURF	(FROZEN_PLANET_ATMOSPHERE*CELL_VOLUME/(FROZEN_PLANET_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define FROZEN_PLANET_MOL_N2			(FROZEN_PLANET_MOL_PER_TURF * FROZEN_PLANET_PER_N2)
#define FROZEN_PLANET_MOL_O2			(FROZEN_PLANET_MOL_PER_TURF * FROZEN_PLANET_PER_O2)
#define FROZEN_PLANET_MOL_N2O			(FROZEN_PLANET_MOL_PER_TURF * FROZEN_PLANET_PER_N2O)
#define FROZEN_PLANET_MOL_CO2			(FROZEN_PLANET_MOL_PER_TURF * FROZEN_PLANET_PER_CO2)
#define FROZEN_PLANET_MOL_PHORON		(FROZEN_PLANET_MOL_PER_TURF * FROZEN_PLANET_PER_PHORON)

//Turfmakers
#define FROZEN_PLANET_SET_ATMOS	nitrogen=FROZEN_PLANET_MOL_N2;oxygen=FROZEN_PLANET_MOL_O2;carbon_dioxide=FROZEN_PLANET_MOL_CO2;phoron=FROZEN_PLANET_MOL_PHORON;temperature=FROZEN_PLANET_AVG_TEMP
#define FROZEN_PLANET_TURF_CREATE(x)	x/frozen_world/nitrogen=FROZEN_PLANET_MOL_N2;x/frozen_world/oxygen=FROZEN_PLANET_MOL_O2;x/frozen_world/carbon_dioxide=FROZEN_PLANET_MOL_CO2;x/frozen_world/phoron=FROZEN_PLANET_MOL_PHORON;x/frozen_world/temperature=FROZEN_PLANET_AVG_TEMP;x/frozen_world/outdoors=TRUE;x/frozen_world/update_graphic(list/graphic_add = null, list/graphic_remove = null) return 0
#define FROZEN_PLANET_TURF_CREATE_UN(x)	x/frozen_world/nitrogen=FROZEN_PLANET_MOL_N2;x/frozen_world/oxygen=FROZEN_PLANET_MOL_O2;x/frozen_world/carbon_dioxide=FROZEN_PLANET_MOL_CO2;x/frozen_world/phoron=FROZEN_PLANET_MOL_PHORON;x/frozen_world/temperature=FROZEN_PLANET_AVG_TEMP

FROZEN_PLANET_TURF_CREATE(/turf/simulated/wall/planetary/frozen)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/wall)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/wall/snowbrick)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/floor)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/floor/wood)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/floor/old_tile/red)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/floor/old_tile/red)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/floor/old_tile/blue)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/floor/old_tile/green)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/floor/outdoors/snow)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/floor/snow2)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/floor/outdoors/ice)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/floor/outdoors/shelfice)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/mineral)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/mineral/ignore_mapgen)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/mineral/floor)
FROZEN_PLANET_TURF_CREATE(/turf/simulated/mineral/floor/ignore_mapgen)
