var Config = {
	
	server_name: 'WeeGo RP',
	pause_after_intro: 3000,
	bg_video: 'oIPhZmmbnDw', // https://www.youtube.com/watch?v=Wqsg2vWHZBM

	radio_volume: 0.05,
	radio_playlist: [
        {name:'Hardstyle', link:'http://server-23.stream-server.nl:8326/stream?type=http&nocache=63527'}, // STREAM
        {name: 'Lil jon - Alive', link:'custom_data/lil_jon_alive.mp3' },
		{name: 'Blessed Mane - Reverse', link:'custom_data/blessed_mane-reverse.mp3' }		// patch
    ],
	
	main_menu: [
		{caption: 'ГЛАВНАЯ', onclick: LS.home.show},
		{caption: 'НОВОСТИ', onclick: LS.news.show},
		{caption: 'ПРАВИЛА', onclick: LS.rules.show},
		{caption: 'КОНТАКТЫ', onclick: LS.contacts.show},
	],
	
	assets :
	{
		bad_tv: './assets/bad_tv.mp4',
	},
};