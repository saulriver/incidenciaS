class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :nit
      t.string :name
      t.string :reason
      t.string :addres
      t.string :telephone
      t.string :contact
      t.boolean :state

      t.timestamps
    end
  end
end
