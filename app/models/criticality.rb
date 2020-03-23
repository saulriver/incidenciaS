class Criticality < ApplicationRecord

    #validates :name, uniqueness: true
    #validates :name, :presence => true
    
    has_many :incidents
    has_many :criticalities
end
