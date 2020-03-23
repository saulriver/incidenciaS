class AddLoginFromUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :login, foreign_key: true
  end
end
