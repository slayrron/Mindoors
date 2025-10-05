if (current_state == cutsceneStates.Active)
{
	switch (current_step) {
		case 0:
			obj_nasada.sprite_index = spr_nasada_left
			obj_player.sprite_index = spr_player_left
			
			if (obj_player.x > 410)
			{
				obj_player.x -= 1.5
				obj_nasada.x -= 1.5
			}
			else
			{
				obj_player.sprite_index = spr_player_up
				current_step++
			}
		break;
		
		case 1:
		{
			if (obj_player.y > 224)
			{
				obj_player.y -= 1.5
				if (obj_nasada.x > 410) 
				{
					obj_nasada.x -= 1.5
				}
			}
			else
			{
				obj_nasada.sprite_index = spr_nasada_up
				create_textbox("ecole_intro")
				current_step++
			}
		}
		break;
		
		case 2: {
			if (!instance_exists(obj_textbox))
			{
				if (obj_nasada.y > 240)
					obj_nasada.y -= 1.5
				else
					current_step++
			}
		}
		break;
		
		case 3:
		{
			current_state = cutsceneStates.Paused
		}
		break;
		
		
		default:
		break
	}
}
else if (current_state == cutsceneStates.Paused)
{
	instance_destroy(self)
}