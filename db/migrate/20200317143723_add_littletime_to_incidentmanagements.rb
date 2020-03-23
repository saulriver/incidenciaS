class AddLittletimeToIncidentmanagements < ActiveRecord::Migration[6.0]
  def change
    add_column :incidentmanagements, :Littletime, :datetime
  end
end
