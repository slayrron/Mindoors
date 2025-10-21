//Les parametres
textbox_largeur = 200
textbox_hauteur = 64
x_offset = 0
y_offset = 144
border = 8
line_sep = 12
line_largeur = textbox_largeur - border * 2
textbox_spr = spr_battle_box
textbox_img = 0 
textbox_img_speed = 0

//Le texte
page = 0 
page_number = 0
text[0] = "Placeholder"
text_longueur[0] = string_length(text[0])
draw_char = 0
text_speed = 1 

//Les options
options[0] = ""
option_link_id[0] = -1
option_pos = 0 
options_number = 0 


setup = false

set_defaults_for_text()
last_free_space = 0

text_pause_timer = 0
text_pause_time = 20