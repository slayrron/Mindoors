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
				counter = 0
				create_textbox("ecole_intro")
				current_step++
			}
		}
		break;
		
		// Contournement du joueur : 4-7
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
			{
				obj_nasada.sprite_index = spr_nasada_right
				current_step++
			}
		break;
		
		case 7:
		{
			if (obj_nasada.x < obj_player.bbox_right - 18)
				obj_nasada.x += 1.5
			else
			{
				obj_nasada.sprite_index = spr_nasada_up
				current_step++
			}
		}
		break;
		
		case 8:
		{
			if (obj_nasada.y > 166)
					obj_nasada.y -= 1.5
			else 
			{
				current_step++
			}
		}
		break
		
		case 9:
		{
			if (counter < 40)
				counter++
			else 
			{
				obj_nasada.sprite_index = spr_nasada_left
				counter = 0
				current_step++
			}
		}
		break
		
		case 10:
		{
			if (counter < 40)
				counter++
			else 
			{
				obj_nasada.sprite_index = spr_nasada_right
				counter = 0
				current_step++
			}
		}
		break
		
		case 11:
		{
			if (counter < 40)
				counter++
			else 
			{
				obj_nasada.sprite_index = spr_nasada_up
				counter = 0
				current_step++
			}
		}
		break
		
		case 12:
		{
			if (counter < 45)
				counter++
			else 
			{
				obj_nasada.sprite_index = spr_nasada_down
				counter = 0
				current_step++
			}
		}
		break
		
		case 13:
		{
			if (counter < 15)
				counter++
			else
			{
				counter = 0
				create_textbox("ecole_start_quest")
				current_step++
			}
		}
		break
		
		case 14:
		{
			if (!instance_exists(obj_textbox))
			{
				current_step++
			}
		}
		
		case 15:
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
	//Debut de la quête : Bacheliers
	array_push(global.party[0].quetes, global.quests.bacheliers)
	instance_destroy(self)
}