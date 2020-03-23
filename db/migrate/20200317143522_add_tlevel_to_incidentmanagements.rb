class AddTlevelToIncidentmanagements < ActiveRecord::Migration[6.0]
  def change
    add_column :incidentmanagements, :Tlevel, :datetime
  end
end
