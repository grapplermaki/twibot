class AddColumnNotnull < ActiveRecord::Migration[5.2]
  def change
    change_table :tweets do |t|  
    t.text :day, :null => false, :default => false
  end
end
