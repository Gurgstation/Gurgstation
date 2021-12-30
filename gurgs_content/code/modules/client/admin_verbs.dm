/client/proc/reset_database_connection()
	set category = "Debug"
	set name = "Reset Database Connections"
	set desc = "WARNING: DO THIS WHEN DATABASE IS FUCKED"

	var/message = reset_database_connections()

	to_chat(usr, message)
