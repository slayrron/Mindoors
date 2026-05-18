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
			
		case "troue louche":
			create_text("Tu peux entendre des voix hurler")
			create_text("Tu sens que tu devrais reculer")
		break
		
		//-----------------PNJ-------------------------------
		case "Maire" :
			create_text("Oh.. C'est toi ? Pourquoi tu me regardes comme ça ?")
			create_text("Bref.. Tu as entendu parler des jeunes qui me déteste ?")
				create_option("oui oui", "absolument")
				create_option("non", "Je ne crois pas")
		break
			
		case "absolument" :
			create_text("PARFAIT, demande leurs de partir.. S'il te plait. Je t'aiderai un jour.")
		break
		case "Je ne crois pas" :
			create_text("Ah.. Bah vas-t-en de ma mairie alors.")
			create_text("Tu es adopté.")
		break
		
		case "Junkie 1" : 
			create_text("Le jeune semble te regarder d'un oeil mauvais")
				create_option("Vous ne devriez pas être là.", "partez")
				create_option("Vous reculez", "Partir")
				
		break
			
			case "partez" :
				create_text("''T'es qui toi ?''")
				create_text("Vous reculez honteusement")
		break
		case "Partir" :
			create_text("Vous reculez honteusement")
		break
			
		case "Junkie 2" :
			if global.junkie2_test == false {
				create_text("''...''")
				global.junkie2_test = true 
			}
			else
				create_text("''Tu veux quoi ? dégages.''")
		break
		
		case "Sleepy man" :
			create_text("Un homme apparement endormi.")
			create_text("Vous avez le sentiment que vous ne devriez pas rester ici.")
		break
		
		case "frigo":
			create_text("De délicieuses créations sont certainement gardées dans ce frigo.")
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
			create_text("Oook... Et on l'a fait où cette soirée ?", "rayan-straight")
			create_text("La dernière fois j’ai choisi.", "hubert-judge")
			create_text("Player, tu as toujours des bonnes idées toi, on te suit !", "nasada-happy")
			create_text("Alleeeeez", "rayan-happy")
		break
		
		case "bacheliers_obj_3_qrt_rayan":
			create_text("Tiens, je crois que cet idiot de Rayan habite dans le coin...", "hubert-straight")
			create_text("...", "rayan-angry")
		break
		
		case "bacheliers_obj_3_rayan":
			if (global.quests.bacheliers.objectif == 3) 
			{
				create_text("Vous êtes devant la maison de Rayan, faire la soirée ici ?")
				create_option("Oui", "bacheliers_obj_3_rayan_oui")
				create_option("Non", noone)
			}
			else 
			{
				create_text("La maison de Rayan.")
			}
		break
		
		case "bacheliers_obj_3_rayan_oui":
			create_text("Quoi ? Chez moi ? Mais mes parents vont-", "rayan-stress")
			create_text("SUPER ! On fait ça chez celui qui n’a pas eu le diplôme.", "hubert-happy")
			create_text("Ok… super..", "rayan-straight")
		break
		
		case "bacheliers_obj_3_qrt_nasada":
			create_text("Oh Nasada habite dans cette rue !", "rayan-happy")
			create_text("Oui !", "nasada-happy")
		break
		
		case "bacheliers_obj_3_nasada":
			if (global.quests.bacheliers.objectif == 3)
			{
				create_text("Vous êtes devant la maison de Nasada, faire la soirée ici ?")
				create_option("Oui", noone, obj_cutscene_bac_3_nasada)
				create_option("Non", noone)
			}
			else
			{
				create_text("La maison de Nasada.")
			}
		break
		
		case "bacheliers_obj_3_nasada_oui":
			create_text("Pourquoi chez moi ? Enfin je veux dire.. hmm..", "nasada-stress")
			create_text("Si ça te dérange on peut..", "hubert-straight")
			create_text("Ouais, on pourrait aller chez Player !", "rayan-straight")
			create_text("Non.. c’est bon ! J’accepte. Je vais juste prévenir mes parents !", "nasada-straight")
		break
		
		
		case "bacheliers_obj_3_qrt_hubert":
			create_text("On arrive vers chez moi", "hubert-straight")
			create_text("Une soirée chez Hubert ? Tu vas nous laisser entrer même ?", "rayan-straight")
			create_text("Ca pourrait être sympa !", "nasada-happy")
		break
		
		case "bacheliers_obj_3_hubert":
			if (global.quests.bacheliers.objectif == 3)
			{
				create_text("Vous êtes devant la maison d'Hubert, faire la soirée ici ?")
				create_option("Oui", "bacheliers_obj_3_hubert_oui")
				create_option("Non", noone)
			}
			else
			{
				create_text("La maison d'Hubert.")
			}
		break
		
		case "bacheliers_obj_3_hubert_oui":
			create_text("Donc chez moi ? Pourquoi pas, mes parents iront dans notre résidence secondaire.", "hubert-straight")
			create_text("La vie est facile pour certains..", "rayan-angry")
			create_text("Et j’en suis fier !", "hubert-happy")
			create_text("Pas la peine de nous chamailler !", "nasada-angry")
		break
		
		case "bacheliers_obj_3_qrt_player":
			create_text("Ah ! On est à coté de chez toi Player", "nasada-happy")
			create_text("Je sais pas comment tu fais. Et en plus t'habite dans un immeuble.", "hubert-straight")
		break
		
		case "bacheliers_obj_3_player":
			if (global.quests.bacheliers.objectif == 3)
			{
				create_text("Vous êtes devant votre immeuble, faire la soirée dans votre appartement ?")
				create_option("Oui", "bacheliers_obj_3_player_oui")
				create_option("Non", noone)
			}
			else
			{
				create_text("Votre immeuble.")
			}
		break
		
		case "bacheliers_obj_3_player_oui":
			create_text("Chez toi ?", "hubert-doubt")
			create_text("C'est la première fois que j'y viens.", "nasada-straight")
			create_text("Bon... pourquoi pas.", "hubert-straight")
		break
		
		case "bacheliers_obj_3_fin":
			create_text("Enfin bon. On fait comment ?", "nasada-straight")
			create_text("On se dit rendez-vous ici dans trois heures ?", "hubert-straight")
			create_text("J’aimerai avoir mon mot à dire aussi !", "rayan-straight")
			create_text("Ceux qui ont échoué n’ont aucun mot à dire, seuls les vainqueurs écrivent l’histoire. J’AI eu le mention très bien, tu n’as même pas le diplôme.", "hubert-happy")
			create_text("Je…", "rayan-stress")
			create_text("...", "rayan-straight")
			create_text("Al-", "hubert-straight", true)
			create_text("STOP. Il vous arrive quoi à tous les deux depuis une semaine ?", "nasada-stress")
			create_text("...", "hubert-straight")
			create_text("Bref.", "hubert-straight")
			create_text("On se rejoint plus tard.", "rayan-straight")
		break
		
		case "bacheliers_obj_4_debut":
			create_text("On devrait y aller nous aussi")
		break
		

		//------------Cinématique secondaire--------//
		
		case "souvenirs_obj_0":
			create_text("Une étrange sensation te monte")
			create_text("Encore un peu plus...")
			create_text("Aucun moyen de savoir pourquoi")
		break

		//-------------- COMBATS --------------------
		case "cbt_slime":
			create_text("Vous essayez de faire ami-ami avec le slime")
			create_text("Le slime n'a visibilement pas compris...")
		break
	}
}

