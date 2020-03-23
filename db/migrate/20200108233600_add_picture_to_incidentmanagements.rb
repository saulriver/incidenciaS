class AddPictureToIncidentmanagements < ActiveRecord::Migration[6.0]
  def change
    add_column :incidentmanagements, :picture, :string
  end
end
