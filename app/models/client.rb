class Client < ApplicationRecord
    paginates_per 5
    max_paginates_per 100
    validates :name, :presence => true
    validates :nit, :presence => true
    validates :addres, :presence => true
    validates :telephone, :presence => true
    validates :nit, uniqueness: true
    validates :name, uniqueness: true
    has_many :userclients
    has_many :applicationclients
    has_many :userapplications
end
