require 'rails_helper'

describe Category do
  it 'vaild with a name' do
    category = Category.new(name: 'manager')
    expect(category).to be_valid
  end
  it 'invalid without a name' do
    category = Category.new(name: nil)
    category.valid?
    expect(category.errors[:name]).to include("是必填项目")
  end
end