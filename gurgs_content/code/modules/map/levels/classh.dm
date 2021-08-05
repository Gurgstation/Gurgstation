//Atmosphere properties
#define CLASSH_ONE_ATMOSPHERE	110.1 //kPa
#define CLASSH_AVG_TEMP	317.3 //kelvin

#define CLASSH_PER_N2		0.72 //percent
#define CLASSH_PER_O2		0.24
#define CLASSH_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define CLASSH_PER_CO2		0.04
#define CLASSH_PER_PHORON	0.00

//Math only beyond this point
#define CLASSH_MOL_PER_TURF	(CLASSH_ONE_ATMOSPHERE*CELL_VOLUME/(CLASSH_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define CLASSH_MOL_N2			(CLASSH_MOL_PER_TURF * CLASSH_PER_N2)
#define CLASSH_MOL_O2			(CLASSH_MOL_PER_TURF * CLASSH_PER_O2)
#define CLASSH_MOL_N2O			(CLASSH_MOL_PER_TURF * CLASSH_PER_N2O)
#define CLASSH_MOL_CO2			(CLASSH_MOL_PER_TURF * CLASSH_PER_CO2)
#define CLASSH_MOL_PHORON		(CLASSH_MOL_PER_TURF * CLASSH_PER_PHORON)

//Turfmakers
#define CLASSH_SET_ATMOS	nitrogen=CLASSH_MOL_N2;oxygen=CLASSH_MOL_O2;carbon_dioxide=CLASSH_MOL_CO2;phoron=CLASSH_MOL_PHORON;temperature=CLASSH_AVG_TEMP
#define CLASSH_TURF_CREATE(x)	x/classh/nitrogen=CLASSH_MOL_N2;x/classh/oxygen=CLASSH_MOL_O2;x/classh/carbon_dioxide=CLASSH_MOL_CO2;x/classh/phoron=CLASSH_MOL_PHORON;x/classh/temperature=CLASSH_AVG_TEMP;x/classh/outdoors=TRUE;x/classh/update_graphic(list/graphic_add = null, list/graphic_remove = null) return 0
#define CLASSH_TURF_CREATE_UN(x)	x/classh/nitrogen=CLASSH_MOL_N2;x/classh/oxygen=CLASSH_MOL_O2;x/classh/carbon_dioxide=CLASSH_MOL_CO2;x/classh/phoron=CLASSH_MOL_PHORON;x/classh/temperature=CLASSH_AVG_TEMP

/*
/datum/atmosphere/planet/classh
	base_gases = list(
	/datum/gas/oxygen = 0.24,
	/datum/gas/nitrogen = 0.72,
	/datum/gas/carbon_dioxide = 0.04
	)
	base_target_pressure = 110.1
	minimum_pressure = 110.1
	maximum_pressure = 110.1
	minimum_temp = 317.3 //Barely enough to avoid baking Teshari
	maximum_temp = 317.3
*/

CLASSH_TURF_CREATE(/turf/simulated/wall/planetary)
CLASSH_TURF_CREATE(/turf/simulated/wall)
CLASSH_TURF_CREATE(/turf/simulated/wall/sandstone)
CLASSH_TURF_CREATE(/turf/simulated/wall/sandstonediamond)
CLASSH_TURF_CREATE(/turf/simulated/floor/outdoors/beach/sand/desert)
CLASSH_TURF_CREATE(/turf/simulated/floor/outdoors/beach/sand/dirt)
CLASSH_TURF_CREATE(/turf/simulated/floor/wood)
CLASSH_TURF_CREATE(/turf/simulated/floor/tiled)
CLASSH_TURF_CREATE(/turf/simulated/floor)
CLASSH_TURF_CREATE(/turf/simulated/floor/water)
CLASSH_TURF_CREATE(/turf/simulated/floor/water/deep)
CLASSH_TURF_CREATE(/turf/simulated/floor/water/shoreline)
CLASSH_TURF_CREATE(/turf/simulated/floor/water/shoreline/corner)
CLASSH_TURF_CREATE(/turf/simulated/mineral)
CLASSH_TURF_CREATE(/turf/simulated/mineral/ignore_mapgen)
CLASSH_TURF_CREATE(/turf/simulated/mineral/floor)
CLASSH_TURF_CREATE(/turf/simulated/mineral/floor/ignore_mapgen)

