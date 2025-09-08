instance_deactivate_all(true)

units = []

// Equipe
for (var i = 0; i < array_length(global.party); i++)
{
	party_units[i] = instance_create_depth(x+144+(i*30), y+150, depth-10, obj_battle_unit_equipe, global.party[i])
	array_push(units, party_units[i])
}

// Ennemies
for (var i = 0; i < array_length(enemies); i++)
{
	enemy_units[i] = instance_create_depth(x+144+((power(-1,i) * ceil(i/2)*30)), y+60, depth-10, obj_battle_unit_enemies, enemies[i])
	array_push(units, enemy_units[i])
}