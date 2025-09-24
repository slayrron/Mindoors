enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

enum TYPE
{
	ATT = 0,
	ACT = 1,
	OBJ = 2,
}

global.skillLibrary = 
{
	coupDePoings:
	{
		nom: "Coup de poings",
		description: "{0} inflige des coups de poings!",
		subMenu: -1,
		ENDCost: 0,
		type: TYPE.ATT,
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
		type: TYPE.ATT,
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
		
	},
	rire:
	{
		nom: "Rire",
		description: "{0} rigole !",
		subMenu: -1,
		ENDCost: 0,
		type: TYPE.ATT,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_hitmarker,
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			BattleChangeStat(_targets[0], [0,-3,0,0,0], 0)
		}
	},
	cris:
	{
		nom: "Cris",
		description: "{0} rigole !",
		subMenu: -1,
		ENDCost: 0,
		type: TYPE.ATT,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_hitmarker,
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			//BattleChangeStat(_targets[0], [0,-3,0,0,0], 0)
		}
	},
	
}

global.objetLibrary = 
{
	baie:
	{
		nom: "Baie",
		description: "Une baie qui soigne 5 PV.",
		type: TYPE.OBJ,
		func: function(_user, _targets) {
			BattleChangePV(_targets[0], 5, 0)
		}
	},
	poisson:
	{
		nom: "Poisson",
		description: "Un bon poisson frais ! Soigne 70 PV.",
		type: TYPE.OBJ,
		func: function(_user, _targets) {
			BattleChangePV(_targets[0], 70, 0)
		}
	}
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
		END: 15,
		skills : [global.skillLibrary.coupDePoings, global.skillLibrary.tranche, global.skillLibrary.rire],
		objets : [global.objetLibrary.baie, global.objetLibrary.poisson],
		sprites : {idle: spr_player_battle_idle, attack: spr_player_battle_idle, down: spr_equipe_battle_down}
	},
	{
		nom: "Hubert",
		sante: 10,
		pvMax: 40,
		pv: 40,
		att: 8,
		def: 0,
		vit: 7,
		agi: 10,
		ENDMax: 22,
		END: 22,
		skills : [global.skillLibrary.coupDePoings],
		sprites : {idle: spr_hubert_battle_idle, attack: spr_hubert_battle_idle, down: spr_equipe_battle_down}
	},
	
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
		vit: 6,
		agi: 1,
		ENDMax: 10,
		END: 10,
		sprites: {idle: spr_slime, attack: spr_slime},
		skills: [global.skillLibrary.tranche],
		playerActions: [{nom: "Communiquer", type: TYPE.ACT, lien: "slime"}],
		AIscript: function()
		{
			//attack
			var _action = skills[0]
			
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