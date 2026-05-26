if (current_state == cutsceneStates.Active){

	switch(action) {
		case 0: 
		
			inst = instance_create_depth(0,0,-9999, obj_fade)
			with inst {
				alpha = 0
				state = "in"
			}
			action++
		break;
	
		case 1:
			if (inst.alpha == 1) //Noir complet
			{
				obj_player.x = 661
				obj_player.y = 253
				obj_player.sprite_index = spr_player_left
				
			action++
			}
		break;
		case 2 : 
			if (counter < 15)
				counter++
			else
			{
				counter = 0
				inst.state = "out" //Début d'éclaircissement
				action++
			}
		break;
		case 3 : 
			counter = 0
					create_textbox("souvenirs_obj_0")
		current_state = cutsceneStates.Stopped
		break
	}
}
else {
	instance_destroy(self)
}