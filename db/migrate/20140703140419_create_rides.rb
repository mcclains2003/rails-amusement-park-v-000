class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.references :user, index: true
      t.references :attraction, index: true
      
      t.timestamps null: false
    end
  end
end
