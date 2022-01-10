/decl/emote/audible
	key = "dofigj" //Scrambled to replace it with burps :3c shhh

/decl/emote/audible/belch
	key = "burp"
	emote_message_3p = "lets out a belch."
	emote_message_3p = "belches."

// Replacing proc definition to make my life easier to randomly pick different sounds C:
// Oh, it does pick them anyway, ahhhh well. :shrug: I'm too tired to work on this anymore, feel free to change it if it breaks in 3 months time. <3
/decl/emote/audible/belch/do_sound(var/atom/user)
	var/sound_to_play = sound(get_sfx("belches"))
	if(sound_to_play)
		playsound(user.loc, sound_to_play, (30+rand(0,50)), vary = 1, falloff = 0.1, ignore_walls = TRUE, preference = /datum/client_preference/belch_noises) //VOREStation Add - Preference // JOKES ON YOU BISH I ADDED A DIFFERENT PREFERENCE OVER YOURS BISH DESTROY'D
