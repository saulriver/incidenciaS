class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.references :area, foreign_key: true
      t.references :userapplication, foreign_key: true
      t.references :user, foreign_key: true
      t.references :criticality, foreign_key: true
      t.datetime :datereport
      t.text :description
      t.string :state

      t.timestamps
    end
  end
end
