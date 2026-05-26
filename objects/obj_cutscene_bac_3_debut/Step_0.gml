if (current_state == cutsceneStates.Active)
{
	switch (action) {
		case 0:
			create_textbox("bacheliers_obj_3")
			action++
		break;
		
		case 1:
			if (no_textbox())
				action++
		break
		
		case 2:
		array_push(global.party, global.heros.rayan)
			current_state = cutsceneStates.Stopped
		break
	}
}
else 
{
	instance_destroy()
}