class Application < ApplicationRecord
    paginates_per 5
    max_paginates_per 100
    
    validates :name, uniqueness: true
    validates :name, :presence => true
    
    has_many :applicationclients
    has_many :applicationoperators
end
