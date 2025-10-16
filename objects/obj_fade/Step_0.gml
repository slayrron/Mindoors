switch (state) {
    case "in": // fondu vers le noir
        alpha = min(alpha + fade_speed, 1)
        break;
    case "out": // fondu depuis le noir
        alpha = max(alpha - fade_speed, 0)
		if (alpha == 0)
			instance_destroy(self)
        break
}
