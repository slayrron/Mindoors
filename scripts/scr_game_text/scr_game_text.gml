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
			create_text("Ca ne devrait pas être très compliqué à trouver.", "hubert-judge")
			create_text("Allons-y alors !", "rayan-happy")
		break
			
		case "bacheliers_obj_0":
			create_text("C'est là !", "rayan-happy")
			create_text("Le moment de vérité...", "nasada-stress")
			create_text("Bon on va pas y passer la journée...", "hubert-judge")
			create_text("Allez les amis on y va ensemble !", "nasada-straight")
		break
		
		case "bacheliers_obj_1_nasada":
			create_text("OUIIII Je l'ai !!")
		break	
		case "bacheliers_obj_1_hubert":
			create_text("hmpf...aucune surprise...", "hubert-judge")
		break
		case "bacheliers_obj_1_player":
			create_text("Vous défilez les noms...non...toujours pas..et..et..vous voila ! Vous l'avez !")
		break
		
		case "bacheliers_obj_1_bravo":
			create_text("Félicitations !!", "nasada-straight")
			create_text("C'était facile.", "hubert-judge")
			create_text("C’est vrai.. j’ai stressée pour rien !", "nasada-straight")
		break
		
		case "bacheliers_obj_1_?":
			create_text("...", "nasada-straight")
			create_text("...", "hubert-judge")
		break
		
		case "bacheliers_obj_1_rayan":
			create_text("...Rayan ?", "nasada-straight")
			create_text("...", "rayan-straight")
			create_text("Je ne me vois pas...", "rayan-straight")
			create_text("Arrête...", "hubert-judge")
			create_text("...", "rayan-straight")
			create_text("Attends, regardons ensemble si on ne te trouve pas !", "nasada-stress")
		break
		
		case "bacheliers_obj_1_ensemble":
			create_text("Non...non...", "nasada-straight")
			create_text("Ouais non.", "hubert-judge")
			create_text("Vous regardez chaque nom, mais celui de Rayan n'est nul part")
			create_text("J’ai...encore raté..", "rayan-straight")
		break
		
		case "bacheliers_obj_1_reunion":
			create_text("...", "nasada-straight")
			create_text("T’es pathétique sérieux. On dirait que tu fais tout pour rater ton avenir..", "hubert-judge")
			create_text("Ça va aller tu crois ? Tes parents vont..", "nasada-stress")
			create_text("T’inquiète ! Ça va le faire !", "rayan-happy")
			create_text("Mais...", "nasada-stress")
			create_text("Bref. Dommage. Ça vous dit qu’on fasse une soirée pour fêter ça ? Le bac, on ne l’a qu’une fois dans notre vie.", "rayan-happy")
		break
		
		case "bacheliers_obj_1_separation":
			create_text("Ou plutôt 0 fois dans ton cas Rayan..", "hubert-judge")
			create_text("..", "rayan-straight")
		break
		
		case "bacheliers_obj_transition_1-2":
			create_text("Hubert...", "nasada-straight")
			create_text("Allez on doit récupérer nos bulletins nous", "hubert-judge")
		break
		
		case "bacheliers_obj_2":
			if (global.quests.bacheliers.objectif < 2) {
				create_text("Je vois que vous venez d'arriver, veuillez vérifier que vous êtes bien sur le tableau s'il vous plait")
				create_text("(je n'ai pas envie de chercher pour rien)")
			}
			else if (global.quests.bacheliers.objectif == 2) {
				create_text("J'ai eu le temps de trouver vos bulletins")
				create_text("Hubert..Nasada..et Player.. Voilà ! Toutes mes félicitations !")
				global.quests.bacheliers.objectif++
			}
			else
			{
				create_text("Encore bravo !")
			}
		break
		
		case "bacheliers_obj_3":
			create_text("Ok on peut partir", "nasada-straight")
			create_text("Ok alors ? Chaud ?", "rayan-straight")
			create_text("On est pas obligé non plus...", "hubert-judge")
			create_text("On pourrait faire un tour aussi...", "nasada-straight")
			create_text("Player, tu as toujours des bonnes idées toi, on te suit !", "nasada-straight")
			create_text("Alleeeeez", "rayan-happy")
		break
		

		//-------------- COMBATS --------------------
		case "cbt_slime":
			create_text("Vous essayez de faire ami-ami avec le slime")
			create_text("Le slime n'a visibilement pas compris...")
		break
	}
}

