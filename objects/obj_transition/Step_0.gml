if (instance_exists(fade) and fade.state == "in" and fade.alpha == 1)
{
	room_goto(target_rm)
	obj_player.x = target_x
	obj_player.y = target_y
	fade.state = "out"
}
else if (!instance_exists(fade))
{
	instance_destroy()
}