var accept_key = keyboard_check_pressed(ord("Z"))


var textbox_x = camera_get_view_x(view_camera[0]) + x_offset
var textbox_y = camera_get_view_y(view_camera[0]) + y_offset

draw_set_color(c_white)

//setup       
if setup == false
{ 
	draw_set_font(global.font_main)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	 
	// boucle sur les pages
	for (var p = 0; p < page_number; p++)
	{
		// trouve combien de caracteres sont sur chaque page et garde ce nombre
		text_longueur[p] = string_length(text[p])
		
		// Perso à gauche
		text_x_offset[p] = 80
		portrait_x_offset[p] = 8
		
		// position x pour la textbox pas de perso
		if (speaker_sprite[p] == noone)
		{
			text_x_offset[p] = 44
		}
		
	}
}

// Prend chaque (indice de) caractère un à un
// pour donner un effet "animation machine à écrire"

if (text_pause_timer <= 0)
{
	if (draw_char < text_longueur[page])
	{
		draw_char = draw_char + text_speed
		draw_char = clamp(draw_char, 0, text_longueur[page])
	
		var _check_char = string_char_at(text[page], draw_char)
		if (_check_char == "," or _check_char == "?" or (_check_char == "!" and string_char_at(text[page], clamp(draw_char+1, 0, text_longueur[page])) != "!") or (_check_char == "." and string_char_at(text[page], clamp(draw_char+1, 0, text_longueur[page])) != "."))
		{
			text_pause_timer = text_long_pause_time
		}
		else if (_check_char != "'")
		{
			text_pause_timer = text_pause_time
		}
	}
}
else
{
	text_pause_timer--
}

//--------Bascule des pages----------
//
//
// Si on appuie pour passer le texte
if (accept_key and draw_char > 1)
{
	// Si toute la page actuelle est déjà affichée
	if (draw_char == text_longueur[page])
	{
		// On passe à la prochaine page s'il en reste
		if (page < page_number - 1) 
		{
			page++ 
			draw_char = 0
		}
		// Si c'était la dernière, on regarde si on doit gérer des choix
		else 
		{	
			if (options_number > 0)
			{ 
				// Vérifie s'il n'y a pas une fonction à executer
				if (array_length(functions[option_pos]) > 0)
				{
					func = functions[option_pos]
					func[0](func[1], func[2])
				}
				
				// Si on a du texte, c'est une nouvelle textbox à afficher
				if (typeof(option_link_id[option_pos]) == "string")
					create_textbox(option_link_id[option_pos])
				
				// Si on a passé une cinématique, on la crée
				else if (object_exists(option_link_id[option_pos]) and object_is_ancestor(option_link_id[option_pos], obj_cutscene_parent))
					instance_create_depth(x,y, -99999, option_link_id[option_pos])
				
				// Sinon (noone), on arrête là
				
			}
			instance_destroy()
		}
	}
	// Si la page actuelle n'est pas terminée
	// On dessine d'un coup tous les caractères restants
	else 
	{
		draw_char = text_longueur[page]
	}
}

//---------- Dessine la textbox ---------------
var txtb_x = textbox_x + text_x_offset[page]
var txtb_y = textbox_y
textbox_spr_l = sprite_get_width(textbox_spr)
textbox_spr_h = sprite_get_height(textbox_spr)

draw_sprite_ext(textbox_spr, textbox_img, textbox_x + text_x_offset[page], textbox_y, textbox_largeur/textbox_spr_l, textbox_hauteur/textbox_spr_h, 0, c_white, 1)

//Affichage du nom si c'est un pnj qui parle
if (speaker_name[page] != noone)
{
	draw_sprite_stretched(textbox_spr, textbox_img, textbox_x + text_x_offset[page], textbox_y - 14, 72, 19)
	draw_text(textbox_x + text_x_offset[page] + 6,  textbox_y - 14, speaker_name[page])
}

//Dessine l'orateur si c'est un heros qui parle
if (speaker_sprite[page] != noone)
{
	sprite_index = speaker_sprite[page]
	var _speaker_x = textbox_x + portrait_x_offset[page]
	draw_sprite_ext(textbox_spr, textbox_img, textbox_x + portrait_x_offset[page], textbox_y, 64/textbox_spr_l, 64/textbox_spr_h, 0, c_white, 1)
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, 1, 1, 0, c_white, 1)
}

//---------- Gestion des choix -----------
//
//
//
// Si on est arrivé à la fin de la dernière page
if (draw_char == text_longueur[page] and page == page_number - 1)
{ 
	var option_space = 15 
	var option_border = 4
	
	
	// Sélection de la réponse (son indice) avec les flêches haut et bas
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	option_pos = clamp(option_pos, 0, options_number - 1)
	
	
	// Dessine les choix s'il y en a, (donc si options_number > 0)
	for (var option = 0; option < options_number; option++)
	{
		// Dessine la textbox associée 
		var option_largeur = string_width(options[option]) + option_border * 2 
		draw_sprite_ext(textbox_spr, textbox_img, txtb_x + 16, txtb_y - option_space*options_number + option_space*option, option_largeur / textbox_spr_l, (option_space - 1) / textbox_spr_h, 0, c_red, 1)
		
		// Dessine la flèche de sélection si on est sur le choix pointé
		if (option_pos == option)
		{
			draw_sprite(spr_fleche, 0, txtb_x, txtb_y - option_space * options_number + option_space * option)
		}
		// Dessine le texte du choix
		draw_text(txtb_x + 16 + option_border, txtb_y - option_space * options_number + option_space * option - 2, options[option])
	}
}

// Affiche le texte
// draw_text_ext() s'occupe de revenir automatiquement à la ligne après que la largeur line_largeur ait été dépassée
//
var characters = string_copy(text[page], 1, draw_char)
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, characters, line_sep, line_largeur)


// Coupe l'orateur actuel et passe au texte suivant automatiquement
if (skip[page])
{
	// Si toute la page actuelle est déjà affichée
	if (draw_char == text_longueur[page])
	{
		// On attend quelques frames avant de passer
		if (text_pause_timer < -5) {
			text_pause_timer = 0
			page++ 
			draw_char = 0
		}
		else
		{
			text_pause_timer--
		}
	}
}