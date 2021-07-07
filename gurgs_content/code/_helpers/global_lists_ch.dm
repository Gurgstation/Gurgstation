/var/global/list/existing_metroids = list() //Global variable for tracking metroids for the event announcement. Needs to go here for load order.

//stuff that only synths can eat
var/global/list/edible_tech = list(/obj/item/weapon/cell,
				/obj/item/weapon/circuitboard,
				/obj/item/integrated_circuit,
				/obj/item/broken_device,
				/obj/item/brokenbug,
				)
