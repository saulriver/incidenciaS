class CreateIncidentmanagements < ActiveRecord::Migration[5.2]
  def change
    create_table :incidentmanagements do |t|
      t.references :user, foreign_key: true
      t.references :incident, foreign_key: true
      t.datetime :datereport
      t.text :description
      t.string :state

      t.timestamps
    end
  end
end
