require 'faker'

sports = ['Soccer', 'Football', 'Basketball', 'Baseball', 'Hockey', 'Lacrosse']
locations = ['Candlestick Park', 'Mission Dolores Park', 'Dolores Park', 'Duboce Park', 'Golden Gate Park',
			'Kezar Stadium', 'Marina Green', 'Rincon Park',
			'Mission Creek Park']


20.times do 
	n = rand(0..100)
	date = Date.today.advance(days: n)
	game_hash = {
		sport: sports.sample,
		location: locations.sample,
		date: date,
		weekday: date.strftime('%A'),
		month_day: date.strftime('%d %b'),
		time: rand(0..24)
	}
	Game.create(game_hash)
end

sports.each do |sp|
	Sport.create(sport: sp)
end