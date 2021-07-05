// Gurgs ADD: Imports belches, brp~
/client/verb/toggle_belch_noises()
	set name = "Audible belching"
	set category = "Preferences"
	set desc = "Toggles audible belches."

	var/pref_path = /datum/client_preference/belch_noises

	toggle_preference(pref_path)

	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear belching.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TBelchNoise")

