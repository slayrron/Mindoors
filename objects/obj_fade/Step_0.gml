switch (state) {
    case "in": // fondu vers le noir
        alpha = min(alpha + fade_speed, 1)
		if (simple and alpha == 1)
			state = "out"
        break;
    case "out": // fondu depuis le noir
        alpha = max(alpha - fade_speed, 0)
		if (alpha == 0)
			instance_destroy(self)
        break
}
