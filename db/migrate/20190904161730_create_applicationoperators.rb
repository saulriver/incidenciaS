class CreateApplicationoperators < ActiveRecord::Migration[5.2]
  def change
    create_table :applicationoperators do |t|
      t.references :user, foreign_key: true
      t.references :application, foreign_key: true
      t.boolean :state

      t.timestamps
    end
  end
end
