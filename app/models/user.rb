class User < ActiveRecord::Base
	has_many :sport_users
	has_many :sports, through: :sport_users

	has_many :game_users
	has_many :games, through: :game_users

	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
	validates :email, uniqueness: true
	validates :email, presence: true
	validates :name, presence: true
	validates :password_hash, presence: true
end
