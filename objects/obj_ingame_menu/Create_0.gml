global.font_main = fnM3x6

menu_level = 0
menu_options = ["Equipement", "Attaques", "Objets", "Options"]
menu_length = array_length(menu_options)
menu_option_pos = 0

elements = [[], global.party, global.party, global.party[0].objets, [{nom: "Quitter"}]]
elm_number = array_length(elements[0])
elm_pos = 0