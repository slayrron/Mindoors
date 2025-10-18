if (current_state == cutsceneStates.Active)
{
	switch (action) {
		case 0:
			inst = instance_create_depth(0,0,-9999, obj_fade)
			with inst {
				alpha = 0
				state = "in"
			}
			action++
		break
		
		case 1:
			if (inst.alpha == 1) {
				obj_nasada.x = 20
				obj_nasada.y = 68
				obj_nasada.sprite_index = spr_nasada_up
			
				obj_player.x = 40
				obj_player.y = 68
				obj_player.sprite_index = spr_player_up
			
				obj_hubert.x = 70
				obj_hubert.y = 68
				obj_hubert.sprite_index = spr_hubert_up
			
				obj_rayan.x = 90
				obj_rayan.y = 68
				obj_rayan.sprite_index = spr_rayan_up
				
				action++
			}
		break
		
		case 2:
			if (counter < 15)
				counter++
			else
			{
				counter = 0
				inst.state = "out"
				action++
			}
		break
		
		case 3:
			if (!instance_exists(obj_fade))
			{
				if (counter < 50) 
					counter++
				else 
				{
					counter = 0
					create_textbox("bacheliers_obj_1_nasada")
					obj_nasada.sprite_index = spr_nasada_down
					action++
				}
			}
		break
		
		case 4:
			if (!instance_exists(obj_textbox))
			{
				if (obj_nasada.y < 120)
					obj_nasada.y++
				else
				{
					obj_nasada.sprite_index = spr_nasada_right
					action++
				}
			}
		break
		
		case 5:
			if (counter < 50) 
				counter++
			else 
			{
				counter = 0
				create_textbox("bacheliers_obj_1_hubert")
				obj_hubert.sprite_index = spr_hubert_down
				action++
			}
		break
		
		case 6:
			if (!instance_exists(obj_textbox))
			{
				if (obj_hubert.y < 120)
					obj_hubert.y++
				else
				{
					obj_hubert.sprite_index = spr_hubert_left
					action++
				}
			}
		break
		
		case 7:
			if (!instance_exists(obj_textbox))
			{
				if (counter < 50) 
					counter++
				else {
					counter = 0
					create_textbox("bacheliers_obj_1_player")
					action++
				}
			}
		break
		
		case 8:
			if (!instance_exists(obj_textbox)) {
				obj_player.sprite_index = spr_player_down
				action++
			}
		break
	
		
		case 9:
			if (obj_player.y < 106)
				obj_player.y++
			else
				action++
		break
		
		case 10:
			create_textbox("bacheliers_obj_1_bravo")
			action++
		break
		
		//Rayan regarde toutes les feuilles
		case 11:
			if (counter > 50)
			{
				if (rayan_loop < 5) {
					obj_rayan.sprite_index = spr_rayan_left
					if (obj_rayan.x > rayan_pos[rayan_loop])
						obj_rayan.x--
					else 
					{
						counter = 0
						rayan_loop++
						obj_rayan.sprite_index = spr_rayan_up
					}
				}
				else
				{
					obj_rayan.sprite_index = spr_rayan_right
					if (obj_rayan.x < rayan_pos[rayan_loop])
						obj_rayan.x++
					else 
					{
						counter = 0
						rayan_loop++
						obj_rayan.sprite_index = spr_rayan_up
					}
				}
			}
			
			if (rayan_loop == 5 and !instance_exists(obj_textbox))
			{
				obj_nasada.sprite_index = spr_nasada_up
				obj_player.sprite_index = spr_player_up
				obj_hubert.sprite_index = spr_hubert_up
				create_textbox("bacheliers_obj_1_?")
			}
			
			else if (rayan_loop == 10)
				action++
			
			counter++
		break
		
		
		case 12:
			if (no_textbox())
			{
				if (counter < 60)
					counter++
				else
				{
					counter = 0
					create_textbox("bacheliers_obj_1_rayan")
					action++
				}
			}
		break
		
		case 13:
			if (no_textbox())
			{
				inst = instance_create_depth(0,0,-9999, obj_fade)
				with inst {
					alpha = 0
					state = "in"
				}
				action++
			}
		break
		
		case 14:
			if (inst.alpha == 1) {
				obj_nasada.x = 20
				obj_nasada.y = 68
				obj_nasada.sprite_index = spr_nasada_up
			
				obj_player.x = 40
				obj_player.y = 68
				obj_player.sprite_index = spr_player_up
			
				obj_hubert.x = 70
				obj_hubert.y = 68
				obj_hubert.sprite_index = spr_hubert_up
			
				obj_rayan.x = 90
				obj_rayan.y = 68
				obj_rayan.sprite_index = spr_rayan_up
				
				action++
			}
		break
		
		case 15:
			if (counter < 15)
				counter++
			else
			{
				counter = 0
				inst.state = "out"
				action++
			}
		break
		
		case 16:
			if (counter < 20)
				counter++
			else
			{
				counter = 0
				create_textbox("bacheliers_obj_1_ensemble")
				action++
			}
		break
		
		case 17:
			if (no_textbox()) 
			{
				obj_rayan.sprite_index = spr_rayan_down
				if (obj_rayan.y < 110)
					obj_rayan.y++
				else
				{
					obj_player.sprite_index = spr_player_down
					obj_nasada.sprite_index = spr_nasada_down
					obj_hubert.sprite_index = spr_hubert_down
					obj_rayan.sprite_index = spr_rayan_left
					action++
				}
			} 
		break
		
		case 18:
			if (obj_rayan.x > 48)
				obj_rayan.x--
			else 
			{
				obj_rayan.sprite_index = spr_rayan_up
				action++
			}
		break
		
		case 19:
			if (counter < 10)
				counter++
			else {
				create_textbox("bacheliers_obj_1_reunion")
				action++
			}
		break
		
		case 20:
			if (no_textbox())
			{
				if (counter < 60)
					counter++
				else 
				{
					create_textbox("bacheliers_obj_1_separation")
					action++
				}
			}
		break
		
		case 21:
			if (no_textbox())
			{
				obj_rayan.sprite_index = spr_rayan_down
				action++
			}
		break
		
		case 22:
			if (obj_rayan.y < 222)
				obj_rayan.y += 2
			else
			{
				create_textbox("bacheliers_obj_transition_1-2")
				action++
			}
		break
		
		case 23:
			global.quests.bacheliers.objectif++
			current_state = cutsceneStates.Paused
		break
	}
}

else {
	instance_destroy(self)
}