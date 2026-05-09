move_speed = 1.5

x_speed = 0
y_speed = 0

sprite[RIGHT] = spr_player_right
sprite[LEFT] = spr_player_left
sprite[UP] = spr_player_up
sprite[DOWN] = spr_player_down

face = DOWN

// Tableau qui stock les dernières positions du joueur et ses sprites
array_size = 50
for (i = 0; i < array_size; i++) {
	latest_pos[i] = [x,y]
	latest_sprite[i] = face
}
