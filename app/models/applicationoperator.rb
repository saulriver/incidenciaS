class Applicationoperator < ApplicationRecord
  paginates_per 5
  max_paginates_per 100
  belongs_to :user
  belongs_to :application
end
