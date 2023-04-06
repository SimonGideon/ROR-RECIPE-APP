class Recipe < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end
