if (current_state == cutsceneStates.Active)
{
	switch (current_step) {
		case 0:
			inst = instance_create_depth(0,0,-9999, obj_fade)
			with inst {
				alpha = 0
				state = "in"
			}
			current_step++
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
				
				current_step++
			}
		break;
		
		case 2:
			if (counter < 10)
				counter++
			else
			{
				counter = 0
				inst.state = "out"
				current_step++
			}
		break
		
		
		case 3:
			current_state = cutsceneStates.Paused
		break
	}
}

else {
	instance_destroy(self)
}