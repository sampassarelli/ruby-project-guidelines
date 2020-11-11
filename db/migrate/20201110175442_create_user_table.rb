class CreateUserTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      #primary_key, username
      t.string :username
    

      t.timestamps 
    end
  end
end
