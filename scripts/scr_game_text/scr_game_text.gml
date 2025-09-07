// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function scr_game_text(_text_id) {
	
	switch(_text_id)
	{
		case "isha" :  
			create_text("Quoi ? Moi ? Grojo ?..")
			create_text("Ah.. Grojo..")
			create_text("Toi aussi il t'a blesser ?")
				create_option("Oui, il m'a fait mal.", "isha-oui")
				create_option("Qui est-il ?", "isha-non")
			break 
			
		case "isha-oui" : 
			create_text("Retrouve le..")
			break
		case "isha-non" :
			create_text("Ah.. Hors de ma vu, Playair.")
			break
	}
}