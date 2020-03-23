class RemoveClientFromUserapplications < ActiveRecord::Migration[5.2]
  def change
    remove_reference :userapplications, :client, foreign_key: true
  end
end
