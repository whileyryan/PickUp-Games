class CreateSportsUsers < ActiveRecord::Migration
	def change 
		create_table :sport_users do |t|
			t.integer :user_id
			t.integer :sport_id
			t.timestamp
		end
	end
end