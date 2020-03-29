class CreateConsults < ActiveRecord::Migration[6.0]
  def change
    create_table :consults do |t|
      t.references :incidentmanagement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
