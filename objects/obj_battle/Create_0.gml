instance_deactivate_all(true)

units = []
equipe = 0
unit_pos = 0
unit_render_order = []

turn_count = 0
round_count = 0
battle_wait_time_frames = 30
battle_wait_time_remaining = 0
current_user = noone
current_action = -1
current_targets = noone

battle_over = false
enemy_obj = {}

menu_options[0] = "ATT/Garde"
menu_options[1] = "Action"
menu_options[2] = "Objets"
menu_options[3] = "Fuir"

t_actions = []


// Equipe
for (var i = 0; i < array_length(global.party); i++)
{
	party_units[i] = instance_create_depth(x+144+(i*30), y+96, depth-10, obj_battle_unit_equipe, global.party[i])
	array_push(units, party_units[i])
}

// Ennemies
for (var i = 0; i < array_length(enemies); i++)
{
	enemy_units[i] = instance_create_depth(x+144+((power(-1,i) * ceil(i/2)*30)), y+58, depth-10, obj_battle_unit_enemies, enemies[i])
	array_push(units, enemy_units[i])
}

// Get turn order
team_turn_order = []

// L'equipe avec le moins de perso commence d'office
if (array_length(party_units) < array_length(enemy_units))
{
	team_turn_order = [party_units, enemy_units]
}
else if (array_length(party_units) > array_length(enemy_units))
{
	team_turn_order = [enemy_units, party_units]
}
else //Si la taille d'equipe est la même, on compare la somme des vitesses
{
	party_speed = 0
	for (i = 0; i < array_length(party_units); i++)
		party_speed += party_units[i].vit
		
	enemy_speed = 0
	for (i = 0; i < array_length(enemy_units); i++)
		enemy_speed += enemy_units[i].vit
		
	if (party_speed == enemy_speed)
	{
		team_turn_order = [party_units, enemy_units]
	}
	else // L'equipe la plus rapide peut rejouer jusqu'a 3x d'affilée selon le rapport de vitesse
	{
		rapport = max(party_speed, enemy_speed) div min(party_speed, enemy_speed)
		if (party_speed > enemy_speed)
		{
			for (i = 0; i < min(rapport,3); i++)
				array_push(team_turn_order,party_units)
			array_push(team_turn_order, enemy_units)
		}
		else
		{
			for (i = 0; i < min(rapport,3); i++)
				array_push(team_turn_order, enemy_units)
			array_push(team_turn_order, party_units)
		}
	}
}

// Get render order
refresh_render_order = function() {
	unit_render_order = []
	array_copy(unit_render_order,0,units,0,array_length(units))
	array_sort(unit_render_order, function(_1, _2)
	{
		return _1.y - _2.y
	})
}

refresh_render_order();

function BattleStateSelectAction()
{
	if (!instance_exists(obj_battle_menu_player)) 
	{
		// On prend l'equipe actuelle
		var _team = team_turn_order[equipe];
	
		// Le perso est mort ou ne peut pas agir ?
		/*if (!instance_exists(_unit)) or (_unit.pv <= 0)
		{
			battle_state = BattleStateVictoryCheck
			exit
		}*/
	
		// Si controllé par le joueur 
		if (_team[0].object_index == obj_battle_unit_equipe)
		{
			menu_player = instance_create_depth(x,y,-99999, obj_battle_menu_player)
			menu_player.party = _team
			menu_player.enemies = enemy_units
		}
		else
		{
			// if unit is AI controlled
			enemies_actions = []
			for (i = 0; i < array_length(enemy_units); i++)
			{
				if (instance_exists(enemy_units[i]) and (enemy_units[i].pv > 0))
				{
					var enemyAction = enemy_units[i].AIscript()
					if (enemyAction != 1)
						array_push(enemies_actions, [enemy_units[i].id, enemyAction[0], enemyAction[1]])
				}
			}
			ScrollActions(enemies_actions)
		}
	}
}

// Sélectionne une par une toutes les actions de l'équipe active
function ScrollActions(_team_actions)
{
	t_actions = _team_actions
	if (unit_pos >= array_length(_team_actions)) {
		unit_pos = 0
		battle_state = BattleStateTurnProgression
	}
	else
	{
		BeginAction(_team_actions[unit_pos])
	}
}


function BeginAction(unit_action) 
{
	
	current_user = unit_action[0]
	current_action = unit_action[1]
	current_targets = unit_action[2]
	
	if (!is_array(current_targets))
		current_targets = [current_targets]

	battle_wait_time_remaining = battle_wait_time_frames
	
	if (current_action.type == TYPE.ACT)
	{
		create_textbox(current_action.lien, depth-10, 30, 130)
	}
	
	if (current_action.type == TYPE.OBJ)
	{
		var find_object = function(_obj, _index)
		{
			return (_obj.nom == current_action.nom)
		}
		obj_index = array_find_index(global.party[0].objets, find_object)
		array_delete(global.party[0].objets, obj_index, 1)
	}

	with (unit_action[0])
	{
		acting = true
		//play user animation if it is defined for that action and that user
		/*if (!is_undefined(_team_actions[i][1][$ "userAnimation"])) && (!is_undefined(_team_actions[i][0].sprites[$ _team_actions[i][1].userAnimation]))
		{
			sprite_index = sprites[$ _team_actions[i][1].userAnimation]
			image_index = 0
		}*/
	}
	battle_state = BattleStatePerformAction
}

function BattleStatePerformAction()
{
	
	if (current_action.type == TYPE.ACT)
	{
		if (!instance_exists(obj_textbox))
		{
			battle_wait_time_remaining--
			if (battle_wait_time_remaining == 0)
				battle_state = BattleStateVictoryCheck
		}
	}
	else
	{
		// if animation etc is still playing
		if (current_user.acting)
		{
			if (current_user.image_index >= current_user.image_number -1)
			{
				with (current_user)
				{
					sprite_index = sprites.idle;
					image_index = 0;
					acting = false;
				}
			
				if (variable_struct_exists(current_action, "effectSprite"))
				{
					if (current_action.effectOnTarget == MODE.ALWAYS or ((current_action.effetOnTarget == MODE.VARIES) and (array_length(current_targets) <= 1)))
					{
						for (var i = 0; i < array_length(current_targets); i++)
						{
							instance_create_depth(current_targets[i].x,current_targets[i].y,current_targets[i].depth-1, obj_battle_effect, {sprite_index: current_action.effectSprite})
						}
					}
					else
					{
						var _effet_sprite = current_action.effectSprite
						if (variable_struct_exists(current_action, "effectSpriteNoTarget"))
							_effect_sprite = current_action.effectSpriteNoTarget
						instance_create_depth(x,y,depth-100, obj_battle_effect,{sprite_index: _effet_sprite})
					}
				}
				current_action.func(current_user, current_targets)
			}
		}
		else //wait for delay and then end the turn
		{
			if (!instance_exists(obj_battle_effect))
			{
				battle_wait_time_remaining--
				if (battle_wait_time_remaining == 0)
					battle_state = BattleStateVictoryCheck
			}	
		}
	}
}

function BattleStateVictoryCheck()
{
	unit_pos++
	enemies_alive = array_filter(enemy_units, function(_unit, _index)
	{ return (_unit.pv > 0) })
	if (array_length(enemies_alive) == 0)
	{
		battle_over = true
		
		// On update les pv de l'équipe
		for (i = 0; i < array_length(party_units); i++)
			global.party[i].pv = party_units[i].pv
		return
	}
	
	party_alive = array_filter(party_units, function(_unit, _index)
	{ return (_unit.pv > 0) })
	
	if (array_length(party_alive) == 0) {
		option[0,0] = {nom: "Echec..."} // TODO: Remplacer par animation + écran gameover
		battle_over = true
		return
	}
	
	// Si la battaile n'est pas terminées, on retourne s'il y a des potentielles actions restantes
	ScrollActions(t_actions)
}

function BattleStateTurnProgression()
{
	turn_count++
	equipe++
	
	//Loop turns
	if (equipe > array_length(team_turn_order) - 1)
	{
		equipe = 0
		round_count++
	}
	battle_state = BattleStateSelectAction
}

battle_state = BattleStateSelectAction