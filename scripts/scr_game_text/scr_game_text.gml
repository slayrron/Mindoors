// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function scr_game_text(_text_id) {
	
	switch(_text_id)
	{	
		
		//-------------- OBJETS --------------------
		case "bouche incendie" :
			create_text("Une bouche d'incendie.")
			break
			
		case "livre":
			create_text("C'est un vieux livre poussiereux. L'ouvrir ?")
				create_option("Oui.", "ouvrons ça")
				create_option("En vrai flemme.", "nouvrons pas")
				break
				
		case "ouvrons ça" : 
			create_text("Il était une fois... Le texte s'arrête ici.")
			break
		case "nouvrons pas" : 
			create_text("Vous avez reposer le livre, l'esprit CHIIIIILL")
			break
			
		
		//-------------- CINEMATIQUES ---------------
		
		case "ecole_intro":
			create_text("Alors c'est aujourd'hui.. j'ai peur de voir les résultats..")
			create_text("M'en parle pas ! Je l'avais déjà raté l'année dernière ce diplôme !..")
			create_text("Mais aujourd’hui.. ")
			create_text("C'est la honte, t'es nul et en plus t'es pauvre.. ridicule.")
			create_text("AHAHAAAAA. Ce qui ne nous tue pas nous rend plus fort ! Pas vrai ?")
			break
			
		case "ecole_start_quest":
			create_text("Bon...par contre...c'est où ?")
			
		//-------------- COMBATS --------------------
		case "cbt_slime":
			create_text("Vous essayez de faire ami-ami avec le slime")
			create_text("Le slime n'a visibilement pas compris...")
			break
	}
}
