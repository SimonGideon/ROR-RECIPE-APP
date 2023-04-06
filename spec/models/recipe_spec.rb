require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create(name: 'Tetteh')
    @recipe = Recipe.create(name: 'Pizza', preparation_time: 2, cooking_time: 3, description: 'Melt and cook',
                            public: true, user_id: @user.id)
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should have valid value' do
    expect(subject.name).to eql 'Pizza'
  end

  it 'Preparation time should be present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'Preparation time should be an integer' do
    expect(subject.preparation_time).to be_an(Integer)
  end

  it 'Preparation time should not be less than 1' do
    subject.preparation_time = -6
    expect(subject).to_not be_valid
  end

  it 'Preparation time should have valid value' do
    expect(subject.preparation_time).to eql 2
  end

  it 'Cooking time should be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'Cooking time should be an integer' do
    expect(subject.cooking_time).to be_an(Integer)
  end

  it 'Cooking time must not be less than 1' do
    subject.cooking_time = -1
    expect(subject).to_not be_valid
  end

  it 'Cooking time should have valid value' do
    expect(subject.cooking_time).to eql 3
  end

  it 'Description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'Description should have valid value' do
    expect(subject.description).to eql 'Melt and cook'
  end

  it 'Public should be a boolean' do
    expect(subject.public).to be(false).or be(true)
  end

  it 'Public should have valid value' do
    expect(subject.public).to eql true
  end
end
