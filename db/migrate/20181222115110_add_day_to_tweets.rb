class AddDayToTweets < ActiveRecord::Migration[5.2]
  def change
    change_table :tweets do |t|  
    t.string :day 
    end
  end
end
