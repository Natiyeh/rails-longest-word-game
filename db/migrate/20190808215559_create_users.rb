class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true, unique: true
      t.string :encrypted_password, null: false
      t.string :session_token
    end
  end
end
 # never store plain text password
 # always encrypt
