event_inherited()

if (pv <= 0)
{
	sprite_index = sprites.down
}
//Si le personnage est réanimé
else if (sprite_index == sprites.down)
{
	sprite_index = sprites.idle
}
