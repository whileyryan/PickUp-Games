class SportUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :sport 

	def self.finding(new_user)
		@array = []
		@event_array = []
		@userSports = SportUser.where(:user_id => new_user)
		@userSports.each do |type|
			@array << Sport.where(:id => type.sport_id).first[:sport]
		end
		@array.each do |x|
			@event_array << Game.where(:sport => x)
		end
		@event_array.flatten!
	end	
end



# fucking god damnt this is the most fucking irritating thing in the fucking world. this shit should be fucking working 
# and I dont really have a fuckton of time before all of this fucking shit needs to be fucking due. this is so FUCKNIG GOD
# DAMN FUCKING IRRITATING. GOD DAMNT 