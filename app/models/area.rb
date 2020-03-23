class Area < ApplicationRecord
    
    validates :name, uniqueness: true
    validates :name, :presence => true
    
    has_many :userareas
    has_many :incidents
end
