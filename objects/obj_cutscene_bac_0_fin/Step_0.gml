if (current_state == cutsceneStates.Active)
{
	switch (action) {
		
		case 0:
			camera_set_view_target(view_camera[0], noone)
			inst = instance_create_depth(0,0,-9999, obj_fade)
			action++
		break;
		
		case 1:
			if (inst.alpha == 1) //Noir complet
			{
				obj_nasada.x = 20
				obj_nasada.y = 200
				obj_nasada.sprite_index = spr_nasada_up
			
				obj_player.x = 40
				obj_player.y = 200
				obj_player.sprite_index = spr_player_up
			
				obj_hubert.x = 70
				obj_hubert.y = 200
				obj_hubert.sprite_index = spr_hubert_up
			
				obj_rayan.x = 90
				obj_rayan.y = 200
				obj_rayan.sprite_index = spr_rayan_up
				camera_set_view_pos(view_camera[0], 0, 0)
				
				action++
			}
		break
		
		case 2:
			if (counter < 15)
				counter++
			else
			{
				counter = 0
				inst.state = "out" //Début d'éclaircissement
				action++
			}
		break
		
		case 3:
			if (!instance_exists(obj_fade))
			{
				if (counter < 50) 
					counter++
					
				else 
					action++ 
			}
			
		break
		
		case 4:
			if (camera_get_view_y(view_camera[0]) < 108) {
				camera_set_view_pos(view_camera[0], 0,camera_get_view_y(view_camera[0])+2)
			}
			else
				action++
		break
		
		case 5:
			if (counter < 65) 
				counter++
			else 
			{
				create_textbox("bacheliers_obj_0")
				action++
			}
		break;
		
		case 6:
			if (no_textbox())
				action++
		break
		
		case 7:
			global.quests.bacheliers.objectif++
			camera_set_view_target(view_camera[0], obj_player)
			obj_player.face = UP
			obj_player.reset_latest_pos()
			current_state = cutsceneStates.Stopped
		break
	}
}

else {
	instance_destroy(self)
}