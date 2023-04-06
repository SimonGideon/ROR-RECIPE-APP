require 'rails_helper'

RSpec.describe 'Foods page', type: :system do
  describe 'Foods /index' do
    before(:each) do
      @user = User.create!(name: 'Tetteh', email: 'tkamen@outlook.com', password: '123456')
      @food = Food.create!(name: 'Tomatoe', measurement_unit: 'kg', quantity: 3, price: 7, user_id: @user.id)
      @food2 = Food.create!(name: 'Baking Powder', measurement_unit: 'g', quantity: 7, price: 20, user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'tkamen@outlook.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      sleep(1)
      visit foods_path
    end

    after(:each) do
      sleep(2)
    end

    it 'displays the name, measurement unit, price of food' do
      expect(page).to have_content(@food.name)
      expect(page).to have_content(@food.measurement_unit)
      expect(page).to have_content(@food.price)
    end

    it 'displays Addfood and Delete button' do
      expect(page).to have_content('New Food')
      expect(page).to have_content('Delete')
    end

    it 'button redirects to a page to add Add food' do
      click_link 'New Food'
      expect(page).to have_current_path new_food_path
    end
  end

  describe 'Foods /new' do
    before(:each) do
      @user = User.create!(name: 'name', email: 'tkamen@outlook.com', password: '123456')
      @food = Food.create!(name: 'Orange', measurement_unit: 'kg', quantity: 8, price: 11, user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'tkamen@outlook.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      sleep(1)
      visit new_food_path
    end

    after(:each) do
      sleep(2)
    end

    it 'displays a form with name, measurement unit, quantity, price' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Measurement unit')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Price')
    end
  end
end
