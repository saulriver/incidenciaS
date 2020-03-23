class CreateUserclients < ActiveRecord::Migration[5.2]
  def change
    create_table :userclients do |t|
      t.references :client, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :state

      t.timestamps
    end
  end
end
