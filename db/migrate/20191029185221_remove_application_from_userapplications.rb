class RemoveApplicationFromUserapplications < ActiveRecord::Migration[5.2]
  def change
    remove_reference :userapplications, :application, foreign_key: true
  end
end
