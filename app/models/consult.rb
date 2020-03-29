class Consult < ApplicationRecord
  belongs_to :incidentmanagement

  paginates_per 10
  max_paginates_per 100
end
