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
				obj_player.sprite_index = spr_player_down
				current_step++
			}
		}
		break;
		
		// Nasada se tourne vers l'école
		case 2: 
		{
			if (counter < 15)
			{
				counter++
			}
			else 
			{
				counter = 0
				obj_nasada.sprite_index = spr_nasada_up
				current_step++
			}
		}
		break;
		
		case 3:
		{
			if (counter < 60)
			{
				counter++
			}
			else
			{
				create_textbox("ecole_intro")
				current_step++
			}
		}
		break;
		
		// Contournement du joueur : 4-6
		case 4:
		{
			if (!instance_exists(obj_textbox))
			{
				if (obj_nasada.y > obj_player.bbox_bottom + 4)
					obj_nasada.y -= 1.5
				else 
				{
					obj_nasada.sprite_index = spr_nasada_left
					current_step++
				}
			}
		}
		break;
		
		case 5:
			if (obj_nasada.x > obj_player.bbox_left - 18)
				obj_nasada.x -= 1.5
			else
			{
				obj_nasada.sprite_index = spr_nasada_up
				current_step++
			}
		break;
		
		case 6:
			if (obj_nasada.y > obj_player.bbox_top - 24)
				obj_nasada.y -= 1.5
			else	
				current_step++
		break;
		
		case 7:
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