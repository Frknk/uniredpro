class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :publicacion
  has_many :responses, dependent: :destroy
end
