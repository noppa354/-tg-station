/mob/living/carbon/slime/death(gibbed)
	if(!gibbed)
		if(is_adult)
			var/mob/living/carbon/slime/M = new /mob/living/carbon/slime(loc)
			M.colour = colour
			M.rabid = 1
			is_adult = 0
			regenerate_icons()
			health = maxHealth
			return

	if(stat == DEAD)	return
	stat = DEAD
	icon_state = "[colour] baby slime dead"
	for(var/mob/O in viewers(src, null))
		O.show_message("<b>The [name]</b> seizes up and falls limp...", 1) //ded -- Urist

	update_canmove()
	if(blind)	blind.layer = 0

	if(ticker && ticker.mode)
		ticker.mode.check_win()

	return ..(gibbed)