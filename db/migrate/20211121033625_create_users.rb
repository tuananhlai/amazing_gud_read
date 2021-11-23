class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.date :birthday
      t.string :password_digest
      t.integer :role

      t.timestamps
    end
  end
end
