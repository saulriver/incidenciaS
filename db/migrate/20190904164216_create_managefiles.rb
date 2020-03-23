class CreateManagefiles < ActiveRecord::Migration[5.2]
  def change
    create_table :managefiles do |t|
      t.references :incidentmanagement, foreign_key: true
      t.string :filetype
      t.boolean :state

      t.timestamps
    end
  end
end
