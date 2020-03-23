class CreateUserapplications < ActiveRecord::Migration[5.2]
  def change
    create_table :userapplications do |t|
      t.references :user, foreign_key: true
      t.references :applicationclient, foreign_key: true
      t.references :application, foreign_key: true
      t.references :client, foreign_key: true
      t.boolean :state

      t.timestamps
    end
  end
end
