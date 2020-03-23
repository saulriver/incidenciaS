class Applicationclient < ApplicationRecord
  paginates_per 5
  max_paginates_per 100
  belongs_to :application
  belongs_to :client
  belongs_to :user
  has_many :userapplications
  
end
