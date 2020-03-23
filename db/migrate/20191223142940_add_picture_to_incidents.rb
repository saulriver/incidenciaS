class AddPictureToIncidents < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :picture, :string
  end
end
