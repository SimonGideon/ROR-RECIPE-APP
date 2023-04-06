require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.create(name: 'Tetteh')
    @food = Food.create(name: 'Tomatoe', measurement_unit: 'kg', price: 7, quantity: 5, user_id: @user.id)
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should have valid value' do
    expect(subject.name).to eql 'Tomatoe'
  end

  it 'Measurement unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'Measurement unit should have a valid value' do
    expect(subject.measurement_unit).to eql 'kg'
  end

  it 'Mrice should be present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'Price should have a valid value' do
    expect(subject.price).to eql 7.0
  end

  it 'Quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'Quantity should have a valid value' do
    expect(subject.quantity).to eql 5.0
  end
end
