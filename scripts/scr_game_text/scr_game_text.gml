// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function scr_game_text(_text_id) {
	
	switch(_text_id)
	{	
		
		//-------------- OBJETS --------------------
		case "bouche incendie" :
			create_text("Une bouche d'incendie.")
		break
			
		case "porte ecole":
			create_text("C'est fermé.")
			create_text("Le lycée est fermé aujourd'hui...regardons autour !", "nasada-straight")
		break
			
		case "barriere travaux":
			create_text("Impossible de passé, c'est en travaux.")
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
			
			//PNJ
		case "Maire" :
			create_text("Oh.. C'est toi ? Pourquoi tu me regardes comme ça ?")
			create_text("Bref.. Tu as entendu parler des jeunes qui me déteste ?")
				create_option("oui oui", "absolument")
				create_option("non", "Je ne crois pas")
		break
			
		case "absolument" :
			create_text("PARFAIT, demande leurs de partir.. S'il te plait. Je t'aiderai un jour.")
		break
		case "je ne crois pas" :
			create_text("Ah.. Bah vas-t-en de ma mairie alors.")
			create_text("Tu es adopté.")
		break
			
		
		//-------------- CINEMATIQUES ---------------
		
		case "bacheliers_intro":
			create_text("Alors c'est aujourd'hui.. j'ai peur de voir les résultats..", "nasada-stress")
			create_text("M'en parle pas ! Je l'avais déjà raté l'année dernière ce diplôme !..", "rayan-straight")
			create_text("Mais aujourd’hui.. ", "rayan-happy")
			create_text("C'est la honte Rayan, t'es pauvre et en plus t'es nul.", "hubert-judge")
			create_text("AHAHAAAAA. Ce qui ne nous tue pas nous rend plus fort ! Pas vrai ?", "rayan-happy")
		break

		case "bacheliers_start":
			create_text("Bon...par contre...c'est où ?", "nasada-straight")
			create_text("Aaaeeeuuuh...", "rayan-straight")
			create_text("Ca ne devrait pas être très compliqué à trouver", "hubert-judge")
			create_text("Allons-y alors !", "rayan-happy")
		break
			
		case "bacheliers_obj_0":
			create_text("C'est là !", "rayan-happy")
			create_text("Le moment de vérité...", "nasada-stress")
			create_text("Bon on va pas y passer la journée...", "hubert-judge")
			create_text("Allez les amis on y va ensemble !", "nasada-straight")
		break

		//-------------- COMBATS --------------------
		case "cbt_slime":
			create_text("Vous essayez de faire ami-ami avec le slime")
			create_text("Le slime n'a visibilement pas compris...")
		break
	}
}

