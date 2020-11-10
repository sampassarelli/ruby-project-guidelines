class CreateEventTable < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :city
      t.string :state
      t.integer :zip
      t.datetime :date


      t.timestamps
    end
  end
end
