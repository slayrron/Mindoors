function new_battle(_enemies, _fond, enemy_obj) {
	battle = instance_create_depth
	(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		-9999,
		obj_battle,
		{enemies: _enemies, creator: id, fond_combat: _fond}
	)
	battle.enemy_obj = enemy_obj
}

function BattleChangePV(_target, _amount, _AliveDeadOrEither = 0)
{
	// _AliveDeadOrEither: 0 - alive only, 1 - dead only, 2 - any
	var _failed = false
	if (_AliveDeadOrEither == 0) && (_target.pv <= 0)
		_failed = true
	if (_AliveDeadOrEither == 1) && (_target.pv > 0)
		_failed = true
	
	var _col = c_white
	if (_amount > 0)
		_col = c_lime
	if (_failed)
	{
		_col = c_white
		_amount = "failed"
	}
	
	// Affiche les dégats
	instance_create_depth(
		_target.x,
		_target.y,
		_target.depth-1,
		obj_battle_floating_text,
		{font: fnM3x6, col: _col, text: string(_amount)}
	)
	if (!_failed)
		_target.pv = clamp(_target.pv + _amount, 0, _target.pvMax)
}

function BattleChangeStat(_target, _stat_modif, _AliveDeadOrEither = 0) 
{	
	// _AliveDeadOrEither: 0 - alive only, 1 - dead only, 2 - any
	var _failed = false
	if (_AliveDeadOrEither == 0) && (_target.pv <= 0)
		_failed = true
	if (_AliveDeadOrEither == 1) && (_target.pv > 0)
		_failed = true
		
	var _col = c_yellow
	var _string = ""
	if (_failed)
	{
		_col = c_white
		_string = "failed"
	}
	
	if (!_failed) {
		_target.att = max(0, _target.att + _stat_modif[0])
		_target.def = max(0, _target.def + _stat_modif[1])
		_target.vit = max(0, _target.vit + _stat_modif[2])
		_target.agi = max(0, _target.agi + _stat_modif[3])
		_target.END = max(0, _target.END + _stat_modif[4])
	
		stat_name = ["Att", "Def", "Vit", "Agi", "End"]
		for (i = 0; i < array_length(stat_name); i++) {
		
			if _stat_modif[i] != 0
				_string += stat_name[i] + ": " + string(_stat_modif[i])
		}
	}
	
	instance_create_depth(
		_target.x,
		_target.y,
		_target.depth-1,
		obj_battle_floating_text,
		{font: fnM3x6, col: _col, text: string(_string)}
	)
}