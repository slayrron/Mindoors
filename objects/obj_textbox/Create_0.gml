// Permet de toujours afficher le cadre au premier plan
depth = -9999

//Les parametres
textbox_largeur = 200
textbox_hauteur = 64
border = 8 
line_sep = 12
line_largeur = textbox_largeur - border * 2
textbox_spr = spr_textbox
textbox_img = 0 
textbox_img_speed = 0

//Le texte
page = 0 
page_number = 0
text[0] = ""
text_longueur[0] = string_length(text[0])
draw_char = 0
text_speed = 1 

//Les options
options[0] = ""
option_link_id[0] = -1
option_pos = 0 
options_number = 0 


setup = false 

global.font_main = Font1