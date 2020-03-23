class CreateUserareas < ActiveRecord::Migration[5.2]
  def change
    create_table :userareas do |t|
      t.references :user, foreign_key: true
      t.references :area, foreign_key: true
      t.boolean :state

      t.timestamps
    end
  end
end
