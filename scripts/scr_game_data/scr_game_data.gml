global.actionLibrary = 
{
	attack:
	{
		nom: "Attaque",
		description: "{0} attaque !",
		subMenu: -1,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_hitmarker, 
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = _user.att
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
		att: 14,
		def: 15,
		vit: 13,
		agi: 10,
		ENDMax: 15,
		END: 1,
		skills : [],
		sprites : {idle: spr_player_battle_idle, attack: spr_player_battle_idle, down: spr_equipe_battle_down}
	}
]

global.enemies =
{
	slime:
	{
		nom: "slime",
		sante: 10,
		pvMax: 40,
		pv: 40,
		att: 10,
		def: 3,
		vit: 4,
		agi: 1,
		ENDMax: 10,
		END: 10,
		skills: [],
		sprites: {idle: spr_slime, attack: spr_slime},
		AIscript: function() {}
	}
}
