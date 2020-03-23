class RemoveOvertimeFromIncidents < ActiveRecord::Migration[6.0]
  def change

    remove_column :incidents, :Overtime, :datetime
  end
end
