class Game < ActiveRecord::Base
	has_many :game_users
	has_many :users, through: :game_users

	validates :sport, presence: true
	validates :location, presence: true
	validate :test_date
	validates :date, presence: true
	def test_date
  		errors.add(:date, "You can't register a game in the past") if self.date && self.date < Date.today
  	end

  	def self.findDayOfWeek(date)
  		return date.to_datetime.strftime("%A")
  	end

  	def self.findMonthDay(date)
  		return date.to_datetime.strftime('%d %b')
  	end
end