class CreateEventTable < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :category
      t.string :city
      t.string :location
      t.string :date


      t.timestamps
    end
  end
end
