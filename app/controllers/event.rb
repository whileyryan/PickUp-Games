get '/create_event' do
  erb :create
end

get '/event/:id' do 
  @event = Game.find(params[:id])
  @attendance_switch = GameUser.findAttend(@event.id, current_user)
  erb :event
end

post '/event/:id/attend' do
  event = Game.find(params[:id])
  p current_user
  current_user.games << event
  event.increment!(:attendance)
  if request.xhr?
    event.attendance.to_json
  else
    redirect '/games'
  end
end

post '/event/:id/unattend' do
  event = Game.find(params[:id])
  p current_user
  event = Game.find(params[:id])
  event.decrement!(:attendance)
  unattend = GameUser.where(:user_id => current_user.id, :game_id => event.id)

  p unattend

  GameUser.delete(unattend)
  if request.xhr?
    event.attendance.to_json
  else
    redirect '/games'
  end
end