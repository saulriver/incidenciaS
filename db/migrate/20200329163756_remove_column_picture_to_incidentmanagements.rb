class RemoveColumnPictureToIncidentmanagements < ActiveRecord::Migration[6.0]
  def change
    remove_column :incidentmanagements, :picture, :string
  end
end
