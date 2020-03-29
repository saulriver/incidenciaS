class RemoveColumnPictureToIncidents < ActiveRecord::Migration[6.0]
  def change
    remove_column :incidents, :picture, :string
  end
end
