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
				obj_nasada.x = 74
				obj_nasada.y = 392
				obj_nasada.sprite_index = spr_nasada_right
			
				obj_hubert.x = 128
				obj_hubert.y = 392
				obj_hubert.sprite_index = spr_hubert_left
			
				obj_rayan.x = 152
				obj_rayan.y = 392
				obj_rayan.sprite_index = spr_rayan_left
			
				obj_player.x = 98
				obj_player.y = 388
				obj_player.sprite_index = spr_player_down
				fade.state = "out"
				action++
			}
			
		break
	
		case 2:
			if (!instance_exists(obj_fade))
			{

				if (counter == 50)
				{
					counter = 0
					create_textbox("bacheliers_obj_3_player_oui")
					action++
				}
				else 
					counter++
			}
		break
		
		case 3:
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
		
		case 4:
			if (no_textbox()) 
			{
				obj_rayan.sprite_index = spr_rayan_right
				obj_hubert.sprite_index = spr_hubert_right
				if (obj_nasada.x > 334)
				{
					instance_destroy(obj_nasada)
					instance_destroy(obj_hubert)
					instance_destroy(obj_rayan)
					fade = instance_create_depth(0,0,-9999, obj_fade)
					with fade 
					{
						alpha = 0
						state = "in"
						simple = true
					}
					action++
				}
				else 
				{
					obj_nasada.x += 2
					obj_hubert.x += 2
					obj_rayan.x += 2
				}
			}
		break
		
		
		case 5:
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