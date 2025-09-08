global.party = [
	{
		nom: "Player",
		sante: 15,
		att: 14,
		def: 15,
		vit: 13,
		agi: 10,
		skills : [],
		sprites : {idle: spr_player_up}
	}
]

global.enemies =
{
	slime:
	{
		nom: "slime",
		sante: 12,
		att: 2,
		def: 3,
		vit: 4,
		agi: 1,
		skills: [],
		sprites: {idle: spr_slime},
		AIscript: function() {}
	}
}
