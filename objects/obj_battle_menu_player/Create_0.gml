active = true
user = ""

menu_option_pos = 0
menu_options[0] = "ATT/Garde"
menu_options[1] = "Action"
menu_options[2] = "Objets"
menu_options[3] = "Fuir"

// Base
option[0,0] = {nom: "La bataille fait rage..."}

// Attaque
option[1,0] = {nom: "Attaque 1"}

// Action
option[2,0] = {nom: "Blabla"}

// Objet
option[3,0] = {nom: "Pomme"}

// Fuir
option[4,0] = {nom: "Fuir"}

option_pos = 0
options_number = 0
menu_level = 0

max_visible_options = 4
scroll_push = 0

selecting_target = false
target_pos = 0
enemies = []
allies = []
possible_targets = []
action = ""
target = ""

function MenuSelectAction(_user, _action, _target) {
	
	active = false
	with (obj_battle) BeginAction(_user, _action, _target)
	with (obj_battle_menu_player) instance_destroy()
}
