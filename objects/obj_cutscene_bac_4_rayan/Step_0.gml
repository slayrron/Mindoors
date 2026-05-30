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
				instance_create_depth(480, 240, -9999, obj_nasada)
				obj_nasada.sprite_index = spr_nasada_right
			
				instance_create_depth(544, 240, -9999, obj_hubert)
				obj_hubert.sprite_index = spr_hubert_left
		
			
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
					counter = 0
					create_textbox("bacheliers_obj_4_rayan_0")
					action++
				}
				else
					counter++
			}
		break
		
		case 3:
			if (no_textbox())
			{
				obj_maison_rayan.image_index = 1
				action++
			}
		break
		
		case 4:
			instance_create_depth(516, 206, -9999, obj_rayan_mom)
			action++
		break
		
		case 5:
			create_textbox("bacheliers_obj_4_rayan_2")
			action++
		break
		
		case 6:
			if (no_textbox())
			{
				if (obj_player.y >= 272)
					action++
				else
				{
					obj_nasada.sprite_index = spr_nasada_up
					obj_hubert.sprite_index = spr_hubert_up
					
					obj_player.y += 2
					obj_nasada.y += 2
					obj_hubert.y += 2
				}
			}
		break
		
		case 7:
			create_textbox("bacheliers_obj_4_rayan_3")
			action++
		break
		
		case 8:
			if (counter == 20) 
			{
				if (obj_hubert.y >= 266)
				{
					counter = 0 
					action++
				}
				else
					obj_hubert.y += 1
			}
			else 
				counter++
		break
		
		case 9:
			if (no_textbox() and counter == 40)
			{
				counter = 0
				fade = instance_create_depth(0,0,-9999, obj_fade)
				with fade {
					alpha = 0
					state = "in"
				}
				action++
			}
			else 
				counter++
		break
		
		case 10:
			if (fade.alpha < 1)
				obj_player.y -= 1
			else 
			{
				obj_nasada.y = 240 
				obj_player.y = 240
				obj_hubert.y = 240
				fade.state = "out"
				action++
			}
		break
		
		case 11:
			if (!instance_exists(obj_fade))
			{
				create_textbox("bacheliers_obj_4_rayan_4")
				action++
			}
		break
		
		case 12:
			if (no_textbox()) 
			{
				array_delete(global.party,1,3)
				current_state = cutsceneStates.Stopped
			}
		break
	}
}
else 
	instance_destroy()