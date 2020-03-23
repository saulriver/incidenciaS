class Userclient < ApplicationRecord
  paginates_per 5
  max_paginates_per 100
  validates :user,  uniqueness: true
  belongs_to :client
  belongs_to :user
end
