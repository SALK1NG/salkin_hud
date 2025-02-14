config = {
	versionCheck = true, -- enables version checking (if this is enabled and there is no new version it won't display a message anyways)
	text = {
		format = '%s',
		--format = '~b~PLZ~w~: %s',
		-- ScriptHook PLD Position
		--posX = 0.225,
		--posY = 0.963,
		-- vMenu PLD Position
		posX = 0.165, --Von Links
		posY = 0.973 --Von oben
	},
	blip = {
		blipText = 'Makierung %s',
		sprite = 8,
		color = 3, -- default 3 (light blue)
		distToDelete = 100.0, -- in meters
		deleteText = 'Strecke entfernt',
		drawRouteText = 'Strecke zu %s',
		notExistText = "Die PLZ gibt es nicht"
	}
}
