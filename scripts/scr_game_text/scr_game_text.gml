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
			create_text("Le lycée est fermé aujourd'hui...regardons autour !", obj_nasada, NEUTRAL)
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
			create_text("Alors c'est aujourd'hui.. j'ai peur de voir les résultats..", obj_nasada, STRESS)
			create_text("M'en parle pas ! Je l'avais déjà raté l'année dernière ce diplôme !..", obj_rayan, NEUTRAL)
			create_text("Mais aujourd’hui.. ", obj_rayan, HAPPY)
			create_text("C'est la honte Rayan, t'es pauvre et en plus t'es nul.", obj_hubert, JUDGE)
			create_text("AHAHAAAAA. Ce qui ne nous tue pas nous rend plus fort ! Pas vrai ?", obj_rayan, HAPPY)
		break

		case "bacheliers_start":
			create_text("Bon...par contre...c'est où ?", obj_nasada, NEUTRAL)
			create_text("Aaaeeeuuuh...", obj_rayan, NEUTRAL)
			create_text("Ca ne devrait pas être très compliqué à trouver.", obj_hubert, JUDGE)
			create_text("Allons-y alors !", obj_rayan, HAPPY)
		break
			
		case "bacheliers_obj_0":
			create_text("C'est là !", obj_rayan, HAPPY)
			create_text("Le moment de vérité...", obj_nasada, STRESS)
			create_text("Bon on va pas y passer la journée...", obj_hubert, JUDGE)
			create_text("Allez les amis on y va ensemble !", obj_nasada, NEUTRAL)
		break
		
		case "bacheliers_obj_1_nasada":
			create_text("OUIIII Je l'ai !!", obj_nasada, HAPPY)
		break	
		case "bacheliers_obj_1_hubert":
			create_text("hmpf...aucune surprise...", obj_hubert, JUDGE)
		break
		case "bacheliers_obj_1_player":
			create_text("Vous défilez les noms...non...toujours pas..et..et..vous voila ! Vous l'avez !")
		break
		
		case "bacheliers_obj_1_bravo":
			create_text("Félicitations !!", obj_nasada, HAPPY)
			create_text("C'était facile.", obj_hubert, JUDGE)
			create_text("C’est vrai.. j’ai stressée pour rien !", obj_nasada, HAPPY)
		break
		
		case "bacheliers_obj_1_?":
			create_text("...", obj_nasada, NEUTRAL)
			create_text("...", obj_hubert, JUDGE)
		break
		
		case "bacheliers_obj_1_rayan":
			create_text("...Rayan ?", obj_nasada, NEUTRAL)
			create_text("...", obj_rayan, NEUTRAL)
			create_text("Je ne me vois pas...", obj_rayan, NEUTRAL)
			create_text("Arrête...", obj_hubert, JUDGE)
			create_text("...", obj_rayan, NEUTRAL)
			create_text("Attends, regardons ensemble si on ne te trouve pas !", obj_nasada, STRESS)
		break
		
		case "bacheliers_obj_1_ensemble":
			create_text("Non...non...", obj_nasada, NEUTRAL)
			create_text("Ouais non.", obj_hubert, JUDGE)
			create_text("Vous regardez chaque nom, mais celui de rayan n'est nul part")
			create_text("J’ai...encore raté..", obj_rayan, NEUTRAL)
		break
		
		case "bacheliers_obj_1_reunion":
			create_text("...", obj_nasada, NEUTRAL)
			create_text("T’es pathétique sérieux. On dirait que tu fais tout pour rater ton avenir..", obj_hubert, JUDGE)
			create_text("Ça va aller tu crois ? Tes parents vont..", obj_nasada, STRESS)
			create_text("T’inquiète ! Ça va le faire !", obj_rayan, HAPPY)
			create_text("Mais...", obj_nasada, STRESS)
			create_text("Bref. Dommage. Ça vous dit qu’on fasse une soirée pour fêter ça ? Le bac, on ne l’a qu’une fois dans notre vie.", obj_rayan, HAPPY)
		break
		
		case "bacheliers_obj_1_separation":
			create_text("Ou plutôt 0 fois dans ton cas Rayan..", obj_hubert, JUDGE)
			create_text("..", obj_rayan, NEUTRAL)
		break
		
		case "bacheliers_obj_transition_1-2":
			create_text("Hubert...", obj_nasada, NEUTRAL)
			create_text("Allez on doit récupérer nos bulletins nous", obj_hubert, JUDGE)
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
			create_text("Oook... Et on l'a fait où cette soirée ?", obj_rayan, NEUTRAL)
			create_text("La dernière fois j’ai choisi.", obj_hubert, JUDGE)
			create_text("Player, tu as toujours des bonnes idées toi, on te suit !", obj_nasada, HAPPY)
			create_text("Alleeeeez", obj_rayan, HAPPY)
		break
		
		case "bacheliers_obj_3_qrt_rayan":
			create_text("Tiens, je crois que cet idiot de rayan habite dans le coin...", obj_hubert, NEUTRAL)
			create_text("...", obj_rayan, ANGRY)
		break
		
		case "bacheliers_maison_rayan":
			if (global.quests.bacheliers.objectif == 3) 
			{
				create_text("Vous êtes devant la maison de rayan, faire la soirée ici ?")
				create_option("Oui", obj_cutscene_bac_3_rayan)
				create_option("Non", noone)
			}
			else if (global.quests.bacheliers.objectif == 4)
			{
				create_text("Etes vous prêt à passer la soirée ?")
				create_option("Oui", obj_cutscene_bac_4_rayan)
				create_option("Pas encore", noone)
			}
			else 
			{
				create_text("La maison de rayan.")
			}
		break
		
		case "bacheliers_obj_3_rayan_oui":
			create_text("Quoi ? Chez moi ? Mais mes parents vont-", obj_rayan, STRESS)
			create_text("SUPER ! On fait ça chez celui qui n’a pas eu le diplôme.", obj_hubert, HAPPY)
			create_text("Ok… super..", obj_rayan, NEUTRAL)
		break
		
		case "bacheliers_obj_3_qrt_nasada":
			create_text("Oh Nasada habite dans cette rue !", obj_rayan, HAPPY)
			create_text("Oui !", obj_nasada, HAPPY)
		break
		
		case "bacheliers_obj_3_nasada":
			if (global.quests.bacheliers.objectif == 3)
			{
				create_text("Vous êtes devant la maison de Nasada, faire la soirée ici ?")
				create_option("Oui", obj_cutscene_bac_3_nasada)
				create_option("Non", noone)
			}
			else
			{
				create_text("La maison de Nasada.")
			}
		break
		
		case "bacheliers_obj_3_nasada_oui":
			create_text("Pourquoi chez moi ? Enfin je veux dire.. hmm..", obj_nasada, "nasada-stress")
			create_text("Si ça te dérange on peut..", obj_hubert, NEUTRAL)
			create_text("Ouais, on pourrait aller chez Player !", obj_rayan, NEUTRAL)
			create_text("Non.. c’est bon ! J’accepte. Je vais juste prévenir mes parents !", obj_nasada, NEUTRAL)
		break
		
		
		case "bacheliers_obj_3_qrt_hubert":
			create_text("On arrive vers chez moi", obj_hubert, NEUTRAL)
			create_text("Une soirée chez Hubert ? Tu vas nous laisser entrer même ?", obj_rayan, NEUTRAL)
			create_text("Ca pourrait être sympa !", obj_nasada, HAPPY)
		break
		
		case "bacheliers_obj_3_hubert":
			if (global.quests.bacheliers.objectif == 3)
			{
				create_text("Vous êtes devant la maison d'Hubert, faire la soirée ici ?")
				create_option("Oui", obj_cutscene_bac_3_hubert)
				create_option("Non", noone)
			}
			else
			{
				create_text("La maison d'Hubert.")
			}
		break
		
		case "bacheliers_obj_3_hubert_oui":
			create_text("Donc chez moi ? Pourquoi pas, mes parents iront dans notre résidence secondaire.", obj_hubert, NEUTRAL)
			create_text("La vie est facile pour certains..", obj_rayan, ANGRY)
			create_text("Et j’en suis fier !", obj_hubert, HAPPY)
			create_text("Pas la peine de nous chamailler !", obj_nasada, ANGRY)
		break
		
		case "bacheliers_obj_3_qrt_player":
			create_text("Ah ! On est à coté de chez toi Player", obj_nasada, HAPPY)
			create_text("Je sais pas comment tu fais. Et en plus t'habite dans un immeuble.", obj_hubert, NEUTRAL)
		break
		
		case "bacheliers_obj_3_player":
			if (global.quests.bacheliers.objectif == 3)
			{
				create_text("Vous êtes devant votre immeuble, faire la soirée dans votre appartement ?")
				create_option("Oui", obj_cutscene_bac_3_player)
				create_option("Non", noone)
			}
			else
			{
				create_text("Votre immeuble.")
			}
		break
		
		case "bacheliers_obj_3_player_oui":
			create_text("Chez toi ?", obj_hubert, DOUBT)
			create_text("C'est la première fois que j'y viens.", obj_nasada, NEUTRAL)
			create_text("Bon... pourquoi pas.", obj_hubert, NEUTRAL)
		break
		
		case "bacheliers_obj_3_fin":
			create_text("Enfin bon. On fait comment ?", obj_nasada, NEUTRAL)
			create_text("On se dit rendez-vous ici dans trois heures ?", obj_hubert, NEUTRAL)
			create_text("J’aimerai avoir mon mot à dire aussi !", obj_rayan, NEUTRAL)
			create_text("Ceux qui ont échoué n’ont aucun mot à dire, seuls les vainqueurs écrivent l’histoire. J’AI eu le mention très bien, tu n’as même pas le diplôme.", obj_hubert, HAPPY)
			create_text("Je…", obj_rayan, "rayan-stress")
			create_text("...", obj_rayan, NEUTRAL)
			create_text("Al-", obj_hubert, NEUTRAL, true)
			create_text("STOP. Il vous arrive quoi à tous les deux depuis une semaine ?", obj_nasada, STRESS)
			create_text("...", obj_hubert, NEUTRAL)
			create_text("Bref.", obj_hubert, NEUTRAL)
			create_text("On se rejoint plus tard.", obj_rayan, NEUTRAL)
		break
		
		case "bacheliers_obj_4_debut":
			create_text("On devrait y aller nous aussi", obj_nasada, NEUTRAL)
		break
		
		case "bacheliers_obj_4_rayan_0":
			create_text("...", obj_nasada, NEUTRAL)
			create_text("Quel idiot, il est en retard alors que c’est devant chez lui ?", obj_hubert, ANGRY)
			create_option("Il est débile", "bacheliers_obj_4_rayan_1", [update_love, global.heros.hubert, 10])
			create_option("Il est sûrement en confrontation avec ses parents", "bacheliers_obj_4_rayan_1")
		break
		
		case "bacheliers_obj_4_rayan_1":
			create_text("Quoi qu’il en soit, j'espère qu’il va bien.", obj_nasada, STRESS)
			create_text("Il va sûrement très bien.", obj_hubert, NEUTRAL)
		break
		
		case "bacheliers_obj_4_rayan_2":
			create_text("Vous faites quoi ici vous ?!")
		break
		
		case "bacheliers_obj_4_rayan_3":
			create_text("PaRdOn..", obj_nasada, STRESS)
		break
		
		case "bacheliers_obj_4_rayan_4":
			create_text("Je vois donc… Vous dormez ici..?")
			create_text("Bien, en revanche, Rayan est puni, il n’a pas eu son bac, donc n’interagissez pas avec lui.")
			create_text("La honte", obj_hubert, HAPPY)
			create_text("...")
			
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

