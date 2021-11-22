class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :photo_url
      t.text :description

      t.timestamps
    end
  end
end
