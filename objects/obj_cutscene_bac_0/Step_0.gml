if (current_state == cutsceneStates.Active)
{
	switch (action) {
		case 0:
			obj_player.sprite_index = spr_player_up
			if (obj_player.y > 128)
				obj_player.y -= 1.5
				
			else
				action++
		break;
		
		case 1:
			create_textbox("bacheliers_obj_0")
			action++
		break;
		
		case 2:
			if (!instance_exists(obj_textbox))
				action++
		break
		
		case 3:
			global.quests.bacheliers.objectif++
			current_state = cutsceneStates.Paused
		break
	}
}

else {
	instance_destroy(self)
}