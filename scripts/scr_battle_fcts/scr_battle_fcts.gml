function new_battle(_enemies, _fond) {
	instance_create_depth
	(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		-9999,
		obj_battle,
		{enemies: _enemies, creator: id, fond_combat: _fond}
	)
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