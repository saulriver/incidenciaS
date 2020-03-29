class Incident < ApplicationRecord
  
  paginates_per 5
  max_paginates_per 100

  validates :description, :presence => true
  validates :area, :presence => true
  
  belongs_to :area
  belongs_to :userapplication
  belongs_to :user
  belongs_to :criticality
  has_many :incidentmanagements
  has_many_attached :images
  
end
