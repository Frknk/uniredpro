class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :publicacions, dependent: :restrict_with_exception
    
end
