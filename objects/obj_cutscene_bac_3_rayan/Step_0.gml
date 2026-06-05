if (current_state == cutsceneStates.Active){

	switch(action) {
		
		case 0: 
			fade = instance_create_depth(0,0,-9999, obj_fade)
			with fade {
				alpha = 0
				state = "in"
			}
			action++
		break
			
		case 1:
			if (fade.alpha == 1)
			{
				obj_nasada.x = 480
				obj_nasada.y = 240
				obj_nasada.sprite_index = spr_nasada_up
			
				obj_hubert.x = 544
				obj_hubert.y = 240
				obj_hubert.sprite_index = spr_hubert_up
			
				obj_rayan.x = 512
				obj_rayan.y = 208
				obj_rayan.sprite_index = spr_rayan_up
			
				obj_player.x = 512
				obj_player.y = 256
				obj_player.sprite_index = spr_player_up
				fade.state = "out"
				action++
			}
			
		break
	
		case 2:
			if (!instance_exists(obj_fade))
			{
				if (counter == 40) 
				{
					obj_rayan.sprite_index = spr_rayan_down
					counter = 0
					action++
				}
				else
					counter++
			}
		break 
	
	
		case 3:
			if (counter == 50)
			{
				counter = 0
				create_textbox("bacheliers_obj_3_rayan_oui")
				action++
			}
			else 
				counter++
		break 
		
		case 4:
			if (no_textbox())
			{
				if (counter == 100) 
				{
					counter = 0
					create_textbox("bacheliers_obj_3_fin")
					action++
				}
				else
					counter++
			}	
		break
		
		case 5:
			if (no_textbox()) 
			{
				obj_hubert.sprite_index = spr_hubert_down
				obj_nasada.sprite_index = spr_nasada_right
				if (obj_hubert.y > 300)
				{
					obj_hubert.sprite_index = spr_hubert_right
					obj_nasada.sprite_index = spr_nasada_down
					action++
				}
				else 
				{
					obj_hubert.y += 2
					obj_nasada.x += 2
				}
			}
		break
		
		case 6:
			if (obj_nasada.y > 300) 
			{
				obj_nasada.sprite_index = spr_nasada_left
				action++
			}
			else
			{
				obj_nasada.y += 2
				obj_hubert.x += 2
			}
		break
		
		case 7:
			if (obj_nasada.x < 324)
			{
				instance_destroy(obj_nasada)
				instance_destroy(obj_hubert)
				fade = instance_create_depth(0,0,-9999, obj_fade)
				action++
			}
			else 
			{
				obj_nasada.x -= 2
				obj_hubert.x += 2
			}
		break
		
		case 8:
			if (fade.alpha == 1)
			{
				instance_destroy(obj_rayan)
				fade.state = "out"
				action++
			}
		break
		
		
		
		case 9:
			if (!instance_exists(obj_fade)) 
			{
				array_delete(global.party,1,3)
				global.quests.bacheliers.objectif++
				current_state = cutsceneStates.Stopped
			}
		break
	}
}
else 
	instance_destroy()