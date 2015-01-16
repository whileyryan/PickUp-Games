class CreateGames < ActiveRecord::Migration
	def change
		create_table :games do |t|
			t.string :sport
			t.string :location
			t.integer :attendance, default: 1
			t.datetime :date
			t.string :weekday
			t.string :month_day
			t.integer :time
			t.timestamp
		end
	end
end