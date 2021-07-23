#if !defined(USING_MAP_DATUM)

	#include "triumph_defines.dm"
	#include "triumph_turfs.dm"
	#include "triumph_things.dm"
	#include "triumph_shuttle_defs.dm"
	#include "triumph_shuttles.dm"
	#include "triumph_telecomms.dm"
	#include "triumph_overmap.dm"
	#include "triumph_areas.dm"
	#include "triumph_virgo3b.dm"


//	#include "submaps/_triumph_submaps.dm"

	#define USING_MAP_DATUM /datum/map/triumph

//	#include "../../maps/triumph/triumph-01-deck1.dmm"
//	#include "../../maps/triumph/triumph-02-deck2.dmm"
//	#include "../../maps/triumph/triumph-03-deck3.dmm"
//	#include "../../maps/triumph/triumph-04-deck4.dmm"
//	#include "../../maps/triumph/triumph-05-flagship.dmm"

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Triumph

#endif
