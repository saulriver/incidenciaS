class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.references :role, foreign_key: true
      t.string :username
      t.string :password
      t.boolean :change_password
      t.boolean :state

      t.timestamps
    end
  end
end
