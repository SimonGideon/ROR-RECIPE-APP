class Food < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end
