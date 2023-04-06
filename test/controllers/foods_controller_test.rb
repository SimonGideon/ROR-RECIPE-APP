require 'test_helper'

class FoodControllerTest < ActionDispatch::IntegrationTest
  test 'should get recipe_food' do
    get food_recipe_food_url
    assert_response :success
  end
end
