class User < ApplicationRecord
  has_secure_password

  validates :emails, presence: true, uniqueness: true, 
            length: { in: 3..100 },
            format: {
              with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
              message: "solo se permiten letras, números y guiones bajos"
            }
  validates :username, presence: true, uniqueness: true, 
            length: { in: 3..15 },
            format: {
              with: /\A[a-zA-Z0-9_]+\z/,
              message: "solo se permiten letras, números y guiones bajos"
            }
  validates :password, presence: true, length: { minimum: 6 }
  validates :promotion, format: { with: /\A(19[8-9]\d|20[012]\d|2030)\z/, message: "El formato de la promoción debe ser un año entre 1980 y 2030" }, allow_blank: true



  belongs_to :faculty, optional: false
  has_many :publicacions, dependent: :destroy
  # un usuario puede tener muchos comentarios
  has_many :comments, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :reactions, dependent: :destroy
  # Agrega esta línea para establecer la relación entre Usuario y Social
  has_one :social, dependent: :destroy
  
  before_save :downcase_attributes


  private

  def downcase_attributes
    self.username = username.downcase 
    self.emails = emails.downcase 
  end
end
