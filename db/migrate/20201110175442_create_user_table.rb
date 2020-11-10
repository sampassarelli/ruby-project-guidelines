class CreateUserTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      #primary_key, username
      t.string :username
      t.string :password
      t.integer :account_balance

      t.timestamps 
    end
  end
end
