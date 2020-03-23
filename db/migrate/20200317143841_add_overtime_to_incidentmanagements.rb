class AddOvertimeToIncidentmanagements < ActiveRecord::Migration[6.0]
  def change
    add_column :incidentmanagements, :Overtime, :datetime
  end
end
