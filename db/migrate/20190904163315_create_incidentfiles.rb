class CreateIncidentfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :incidentfiles do |t|
      t.references :incident, foreign_key: true
      t.string :filetype
      t.boolean :state

      t.timestamps
    end
  end
end
