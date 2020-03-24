class CreateIncidentAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :incident_admins do |t|

      t.timestamps
    end
  end
end
