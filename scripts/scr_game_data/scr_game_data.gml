global.actionLibrary = 
{
	coupDePoings:
	{
		nom: "Coup de poings",
		description: "{0} inflige des coups de poings!",
		subMenu: -1,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_hitmarker, 
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = max(0, _user.att*0.2 - _targets[0].def)
			BattleChangePV(_targets[0], -_damage, 0)
		}
	},
	tranche:
	{
		nom: "Tranche",
		description: "{0} tranche sa cible !",
		subMenu: -1,
		ENDCost: 0,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_hitmarker, 
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = max(0, _user.att*0.4 - _targets[0].def)
			BattleChangePV(_targets[0], -_damage, 0)
		}
		
	}
}

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

global.party = [
	{
		nom: "Player",
		sante: 15,
		pvMax: 60,
		pv: 60,
		att: 24,
		def: 2,
		vit: 13,
		agi: 10,
		ENDMax: 15,
		END: 1,
		skills : [global.actionLibrary.coupDePoings, global.actionLibrary.tranche],
		sprites : {idle: spr_player_battle_idle, attack: spr_player_battle_idle, down: spr_equipe_battle_down}
	}
]

global.enemies =
{
	slime:
	{
		nom: "Slime",
		sante: 10,
		pvMax: 40,
		pv: 8,
		att: 10,
		def: 1,
		vit: 4,
		agi: 1,
		ENDMax: 10,
		END: 10,
		sprites: {idle: spr_slime, attack: spr_slime},
		actions: [global.actionLibrary.tranche],
		AIscript: function()
		{
			//attack
			var _action = actions[0]
			
			//target
			
			//Parcourt l'enesemble des adversaires et séléctionne uniquement ceux attackables
			var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index)
			{
				return (_unit.pv > 0)
			})
			var _target = _possible_targets[irandom(array_length(_possible_targets)-1)]
			return [_action, _target]
		}
	}
}
