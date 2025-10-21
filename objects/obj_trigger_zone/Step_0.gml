if (place_meeting(x,y, obj_player)) {
	
	if (array_contains(global.party[0].quetes, quete) and quete.objectif == objectif_index)
	{
		if (text_id == "")
			instance_create_depth(x,y, -99999, cutscene)
		else
			create_textbox(text_id)
		instance_destroy(self)
	}
}