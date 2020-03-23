class CreateCriticalities < ActiveRecord::Migration[5.2]
  def change
    create_table :criticalities do |t|
      t.string :name
      t.boolean :state

      t.timestamps
    end
  end
end
