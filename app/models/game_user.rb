class GameUser < ActiveRecord::Base
	belongs_to :game
	belongs_to :user 

	def self.find_game(user)
		game_array = []
		#find all games that a user is attending.
		#user = current_user.id
		events = GameUser.where(:user_id => user)
		events.each do |game|
			game_array << Game.find(game.game_id)
		end
		game_array
	end	

	def self.findAttend(event, user)
		if user == nil
			return false
		end
		@switch = GameUser.where(:user_id => user.id, :game_id => event)
		if @switch.empty?
			return false
		else
			return @switch
		end
	end
end