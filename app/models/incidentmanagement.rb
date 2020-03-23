class Incidentmanagement < ApplicationRecord

  include AASM

  #Columna con la cual manejaremos los estados!
  aasm column: 'state' do 
    state :abierta, initial: true
    state :gestionando
    state :terminada
    state :aprobada
    state :rechazada
    state :cerrada
    
    event :gestionar do
      transitions from: :abierta, to: :gestionando
    end

    event :terminar do
      transitions from: :gestionando, to: :terminada
    end

    event :aprobar do
      transitions from: :terminada, to: :aprobada
    end

    event :rechazar do
      transitions from: :terminada, to: :rechazada
    end

    event :abrir do
      transitions from: :rechazada, to: :abierta
    end

    event :cerrar do
      transitions from: :aprobada, to: :cerrada
    end

  end
  
  has_many :managefiles, dependent: :destroy
  accepts_nested_attributes_for :managefiles, allow_destroy: true,
    reject_if: :all_blank # Ignore the blank template record

   mount_uploader :picture, PictureUploader
   
  paginates_per 5
  max_paginates_per 100
  #validates :picture, :presence => true
  #validates :description, :presence => true
  belongs_to :user
  belongs_to :incident
end