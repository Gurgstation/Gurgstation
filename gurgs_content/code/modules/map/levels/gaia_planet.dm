//Atmosphere properties
#define GAIA_ATMOSPHERE	110.1 //kPa
#define GAIA_AVG_TEMP	300.6 //kelvin

#define GAIA_PER_N2		0.78 //percent
#define GAIA_PER_O2		0.22
#define GAIA_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define GAIA_PER_CO2		0.00
#define GAIA_PER_PHORON	0.00

//Math only beyond this point
#define GAIA_MOL_PER_TURF	(GAIA_ATMOSPHERE*CELL_VOLUME/(GAIA_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define GAIA_MOL_N2			(GAIA_MOL_PER_TURF * GAIA_PER_N2)
#define GAIA_MOL_O2			(GAIA_MOL_PER_TURF * GAIA_PER_O2)
#define GAIA_MOL_N2O			(GAIA_MOL_PER_TURF * GAIA_PER_N2O)
#define GAIA_MOL_CO2			(GAIA_MOL_PER_TURF * GAIA_PER_CO2)
#define GAIA_MOL_PHORON		(GAIA_MOL_PER_TURF * GAIA_PER_PHORON)

//Turfmakers
#define GAIA_SET_ATMOS	nitrogen=GAIA_MOL_N2;oxygen=GAIA_MOL_O2;carbon_dioxide=GAIA_MOL_CO2;phoron=GAIA_MOL_PHORON;temperature=GAIA_AVG_TEMP
#define GAIA_TURF_CREATE(x)	x/gaia/nitrogen=GAIA_MOL_N2;x/gaia/oxygen=GAIA_MOL_O2;x/gaia/carbon_dioxide=GAIA_MOL_CO2;x/gaia/phoron=GAIA_MOL_PHORON;x/gaia/temperature=GAIA_AVG_TEMP;x/gaia/outdoors=TRUE;x/gaia/update_graphic(list/graphic_add = null, list/graphic_remove = null) return 0
#define GAIA_TURF_CREATE_UN(x)	x/gaia/nitrogen=GAIA_MOL_N2;x/gaia/oxygen=GAIA_MOL_O2;x/gaia/carbon_dioxide=GAIA_MOL_CO2;x/gaia/phoron=GAIA_MOL_PHORON;x/gaia/temperature=GAIA_AVG_TEMP

/*
/datum/atmosphere/planet/gaia_planet
	base_gases = list(
	/datum/gas/oxygen = 0.22,
	/datum/gas/nitrogen = 0.78
	)
	base_target_pressure = 110.1
	minimum_pressure = 110.1
	maximum_pressure = 110.1
	minimum_temp = 293.3
	maximum_temp = 307.3
*/

GAIA_TURF_CREATE(/turf/simulated/wall/planetary)

GAIA_TURF_CREATE(/turf/simulated/wall)
GAIA_TURF_CREATE(/turf/simulated/wall/sandstone)
GAIA_TURF_CREATE(/turf/simulated/wall/sandstonediamond)
GAIA_TURF_CREATE(/turf/simulated/floor/outdoors/beach/sand)
GAIA_TURF_CREATE(/turf/simulated/floor/outdoors/beach/sand/desert)
GAIA_TURF_CREATE(/turf/simulated/floor/outdoors/grass)
GAIA_TURF_CREATE(/turf/simulated/floor/wood)
GAIA_TURF_CREATE(/turf/simulated/floor/tiled)
GAIA_TURF_CREATE(/turf/simulated/floor)
GAIA_TURF_CREATE(/turf/simulated/floor/water)
GAIA_TURF_CREATE(/turf/simulated/floor/water/deep)
GAIA_TURF_CREATE(/turf/simulated/floor/water/shoreline)
GAIA_TURF_CREATE(/turf/simulated/floor/water/shoreline/corner)
GAIA_TURF_CREATE(/turf/simulated/floor/outdoors/beach/sand)
GAIA_TURF_CREATE(/turf/simulated/floor/outdoors/dirt)
GAIA_TURF_CREATE(/turf/simulated/mineral)
GAIA_TURF_CREATE(/turf/simulated/mineral/ignore_mapgen)
GAIA_TURF_CREATE(/turf/simulated/mineral/floor)
GAIA_TURF_CREATE(/turf/simulated/mineral/floor/ignore_mapgen)
