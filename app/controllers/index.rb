get '/' do
  @games = Game.all
  @new_game = Game.new
  @signin_error = false
  erb :index
end

get '/account' do
  @sports = Sport.all
  @interested_sports = SportUser.finding(current_user.id)
  @game_attendance = GameUser.find_game(current_user.id)
  erb :account
end

get '/sign_up' do
  @user = User.new
  erb :sign_up
end

post '/sign_up' do
  @user = User.create(name: params[:name], email: params[:email], password_hash: params[:password])
  session[:user_id] = @user.id
  if @user.errors.full_messages.nil?
    redirect '/account'
  else
    erb :sign_up
  end
end

get '/facebook_signup/:email/:name' do
  @user = User.create(name: params[:name].gsub('"',''), email: params[:email].gsub('"',''), password_hash: 'test')
  session[:user_id] = @user.id
  if @user.errors.full_messages.nil?
    p 'cool'
    redirect '/account'
  else
    erb :sign_up
  end
end

get '/signin_error' do
  @signin_error = true
  @games = Game.all
  @new_game = Game.new
  erb :index
end

post '/sign_in' do
  @user = User.where(email: params[:email], password_hash: params[:password])
  if !@user.empty?
    session[:user_id] = @user[0].id
    redirect '/account'
  else
    redirect '/signin_error'
  end
end

get '/facebook_signin/:email/:name' do
  @user = User.where(email: params[:email], name: params[:name])
  if !@user.empty?
    session[:user_id] = @user[0].id
    redirect '/account'
  else
    redirect '/signin_error'
  end
end

get '/sign_out' do
  session[:user_id] = nil
  redirect '/'
end

post '/add_sport' do 
  choice_count = params[:sport].count
  session[:id] = params[:FUCKINGID]  
  params[:sport].each do |k, v|
    SportUser.create(:user_id => current_user.id, :sport_id => v.to_i)
  end
  redirect '/account'
end

post '/search' do 
  p params[:search_item].capitalize!
  @sport = Game.where("#{:sport} LIKE (?)", "%#{params[:search_item]}%").order(:date)
  if @sport.empty?
    @sport = Game.where("#{:location} LIKE (?)", "%#{params[:search_item]}%").order(:date)
    # p "*********************************************!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#{@sport.inspect}"
  end
  if @sport.empty?
    # p "SWEET"
    @sport = Game.where("#{:weekday} LIKE (?)", "%#{params[:search_item]}%").order(:date)
  end
  erb :games
end