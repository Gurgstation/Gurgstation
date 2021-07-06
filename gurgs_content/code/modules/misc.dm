// Random unsorted shit can go here! WOOO!

// Used in job_controller.dm for late vore joining.
/datum/controller/occupations/proc/m_backup_client(var/client/C)	//Same as m_backup, but takes a client entry. Used for vore late joining.
	if(!ishuman(C.mob))
		return
	var/mob/living/carbon/human/CM = C.mob
	SStranscore.m_backup(CM.mind, CM.nif, TRUE)