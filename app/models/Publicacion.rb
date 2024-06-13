class Publicacion < ApplicationRecord
    has_one_attached :imagen
    has_one_attached :video

    validates :titulo, presence: true 
    validates :descripcion, presence: true 
    

    def self.search(query)
        where("titulo ILIKE :query OR descripcion ILIKE :query", query: "%#{query}%")
    end
    has_many :comments, dependent: :destroy
    has_many :notifications, dependent: :destroy
    has_many :reactions, dependent: :destroy
    # publicación puede tener muchos comentarios. 

    belongs_to :category
    belongs_to :user, default: -> {Current.user}

end

