class User < ApplicationRecord
  paginates_per 5
  max_paginates_per 100
  validates :name, :presence => true
  validates :name, uniqueness: true
  validates :email, :presence => true
  validates :email, uniqueness: true
  validates :username, :presence => true
  belongs_to :role
  belongs_to :login
  has_many :applicationclients
  has_many :userclients
  has_many :userapplications
  has_many :userareas
  has_many :applicationoperators
  has_many :incidents
  has_many :incidentmanagements
end
