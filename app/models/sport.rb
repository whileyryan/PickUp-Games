class Sport < ActiveRecord::Base
	has_many :sport_users
	has_many :users, through: :sport_users

	
end