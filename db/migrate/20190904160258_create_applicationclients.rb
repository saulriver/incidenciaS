class CreateApplicationclients < ActiveRecord::Migration[5.2]
  def change
    create_table :applicationclients do |t|
      t.references :user, foreign_key: true
      t.references :application, foreign_key: true
      t.references :client, foreign_key: true
      t.integer :servicelevel
      t.boolean :state

      t.timestamps
    end
  end
end
