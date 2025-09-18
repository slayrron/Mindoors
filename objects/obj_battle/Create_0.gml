instance_deactivate_all(true)

units = []
turn = 0
unit_turn_order = []
unit_render_order = []

turn_count = 0
round_count = 0
battle_wait_time_frames = 30
battle_wait_time_remaining = 0
current_user = noone
current_action = -1
current_targets = noone


menu_options[0] = "ATT/Garde"
menu_options[1] = "Action"
menu_options[2] = "Objets"
menu_options[3] = "Fuir"


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
unit_turn_order = array_shuffle(units);

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
		// On prend le perso actuel
		var _unit = unit_turn_order[turn];
	
		// Le perso est mort ou ne peut pas agir ?
		if (!instance_exists(_unit)) or (_unit.pv <= 0)
		{
			battle_state = BattleStateVictoryCheck
			exit
		}
		//BeginAction(_unit.id, global.actionLibrary.attack, _unit.id)
	
		//if unit in player controlled
		if (_unit.object_index == obj_battle_unit_equipe)
		{
			menu_player = instance_create_depth(x,y,-99999, obj_battle_menu_player)
			menu_player.user = _unit
			menu_player.option[1] = _unit.skills
		}
		else
		{
			//if unit is AI controlled
			var _enemyAction =_unit.AIscript()
			if (_enemyAction != 1) {
				BeginAction(_unit.id, _enemyAction[0], _enemyAction[1])
			}
		}
	}
}


function BeginAction(_user, _action, _targets) 
{
	current_user = _user
	current_action = _action
	current_targets = _targets
	
	if (!is_array(current_targets))
		current_targets = [current_targets]
	
	battle_wait_time_remaining = battle_wait_time_frames
	
	with (_user)
	{
		acting = true
		//play user animation if it is defined for that action and that user
		if (!is_undefined(_action[$ "userAnimation"])) && (!is_undefined(_user.sprites[$ _action.userAnimation]))
		{
			sprite_index = sprites[$ _action.userAnimation]
			image_index = 0
		}
	}
	battle_state = BattleStatePerformAction
}

function BattleStatePerformAction()
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

function BattleStateVictoryCheck()
{
	battle_state = BattleStateTurnProgression
}

function BattleStateTurnProgression()
{
	turn_count++
	turn++
	
	//Loop turns
	if (turn > array_length(unit_turn_order) -1)
	{
		turn = 0
		round_count++
	}
	battle_state = BattleStateSelectAction
}

battle_state = BattleStateSelectAction