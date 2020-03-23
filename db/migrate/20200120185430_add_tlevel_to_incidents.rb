class AddTlevelToIncidents < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :Tlevel, :datetime
  end
end
