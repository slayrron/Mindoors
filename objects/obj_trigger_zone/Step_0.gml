if (place_meeting(x,y, obj_player)) {
	
	if (array_contains(global.party[0].quetes, quete) and quete.objectif == objectif_index)
	{
		instance_create_depth(x,y, -99999, cutscene)
		instance_destroy(self)
	}
}