active = true
changing_char = false
waiting = 0

party = []
party_member = 0
party_actions = []
enemies = []

menu_option_pos = 0
menu_options[0] = "ATT/Garde"
menu_options[1] = "Action"
menu_options[2] = "Objets"
menu_options[3] = "Fuir"

// Base
option[0,0] = {nom: "La bataille fait rage..."}

// Attaque
option[1] = {}

// Action
option[2] = {}

// Objet
option[3] = {}

// Fuir
option[4,0] = {nom: "Fuir"}

// Stats
option[5] = {}

option_pos = 0
options_number = 0
menu_level = 0

max_visible_options = 4
scroll_push = 0

selecting_target = false
target_pos = 0
possible_targets = []
action = ""
target = ""

function MenuSelectAction(_user, _action, _target) {
	
	active = false
	_party_actions[party_member] = [_user, _action, _target]
	if (party_member != array_length(party) - 1) {
		waiting = 10
		changing_char = true
	}
	else
	{
		with (obj_battle) ScrollActions(other._party_actions)
		with (obj_battle_menu_player) instance_destroy()
	}
}
