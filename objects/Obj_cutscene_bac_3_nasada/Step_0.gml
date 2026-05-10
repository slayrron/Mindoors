if (current_state == cutsceneStates.Active){

	switch(action) {
		case 0: 
			obj_nasada.x = 495
			obj_nasada.y = 272
			obj_nasada.sprite_index = spr_nasada_up
			
			obj_hubert.x = 471
			obj_hubert.y = 246
			obj_hubert.sprite_index = spr_hubert_up
			
			obj_rayan.x = 560
			obj_rayan.y = 246
			obj_rayan.sprite_index = spr_rayan_up
			
			obj_player.x = 526
			obj_player.y = 246
			obj_player.sprite_index = spr_player_up
		action++
	break
	
	case 1 :
	if (obj_nasada.y > 220)
		obj_nasada.y--
	else {
		if counter == 20 {
			obj_nasada.sprite_index = spr_nasada_down
		action++
		}
		else
			counter++
	}
	break 
	
	
	case 2 :
	if (counter == 40) {
		create_textbox("bacheliers_obj_3_nasada_oui")
		action++
		
	}
	else 
		counter++
	break 
	
	case 3 : 
	if (no_textbox())
		current_state = cutsceneStates.Paused
	break 
	}

}
else 
	instance_destroy()


