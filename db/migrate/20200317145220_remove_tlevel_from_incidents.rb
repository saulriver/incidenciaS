class RemoveTlevelFromIncidents < ActiveRecord::Migration[6.0]
  def change

    remove_column :incidents, :Tlevel, :datetime
  end
end
