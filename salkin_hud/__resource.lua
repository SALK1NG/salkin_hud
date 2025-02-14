resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'salkin_hud'

ui_page 'html/ui.html'

client_scripts {
	'client.lua'
}

files {
	'html/ui.html',
	'html/style.css',
	'html/grid.css',
	'html/main.js',
	--Jobs
	'html/img/jobs/*.png',

	--Rest
	'html/img/*.png',
}
