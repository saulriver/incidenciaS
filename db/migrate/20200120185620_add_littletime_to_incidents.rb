class AddLittletimeToIncidents < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :Littletime, :datetime
  end
end
