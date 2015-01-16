get '/games' do 
  @sport = Game.order(:date)
  erb :games
end

get '/games/display_sport' do 
	@sport = Game.where(:sport => params[:sport]).order(:date)
	content_type :json
	@sport.to_json
end

get '/games/display_day' do 
	@sport = Game.where(:weekday => params[:day]).order(:date)
		
	content_type :json
	@sport.to_json
end

get '/games/display_all' do 
	@sport = Game.order(:date)
		
	content_type :json
	@sport.to_json
end

post '/create' do
  p params[:time]
  p params[:date].empty?
  if !params[:date].empty?
	  weekday = Game.findDayOfWeek(params[:date])
	  month_day = Game.findMonthDay(params[:date])
  end
  @new_game = Game.create(sport: params[:sport], location: params[:location], date: params[:date], weekday: weekday, month_day: month_day, time: params[:time])
  if @new_game.errors.full_messages.nil?
    redirect '/games'
  else
  	@games = Game.all
    erb :index
  end
end
