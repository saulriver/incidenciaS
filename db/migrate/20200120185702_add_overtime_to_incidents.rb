class AddOvertimeToIncidents < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :Overtime, :datetime
  end
end
