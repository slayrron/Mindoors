menu_level = 0
menu_options = ["Quêtes", "Stats", "Attaques", "Objets", "Options"]
menu_length = array_length(menu_options)
menu_option_pos = 0

elements = [[], global.party[0].quetes, global.party, global.party, global.party[0].objets, [{nom: "Quitter"}]]
elm_number = array_length(elements[0])
elm_pos = 0

stat_name = ["Santé", "Attaque", "Défense", "Vitesse", "Agilité"]

line_sep = 12
border = 32
detail_box_y = 92
detail_box_w = 324
detail_box_h = 432