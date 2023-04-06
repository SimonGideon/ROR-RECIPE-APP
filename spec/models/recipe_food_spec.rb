require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    @user = User.create(name: 'Tetteh')
    @food = Food.create(name: 'Tomatoe', measurement_unit: 'kg', price: 7, quantity: 5, user_id: @user.id)
    @recipe = Recipe.create(name: 'Pizza', preparation_time: 1, cooking_time: 2, description: 'Melt and cook',
                            public: true, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 13.0, food_id: @food.id, recipe_id: @recipe.id)
  end

  before { subject.save }

  it 'Quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'Quantity should have valid value' do
    expect(subject.quantity).to eql 13.0
  end

  it 'Quantity should be a integer' do
    expect(subject.quantity).to be_a(Float)
  end
end
