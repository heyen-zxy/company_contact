require 'rails_helper'

describe User do

  it 'vaild with a name, a category_id, a tel, a address' do
    user = User.new(category_id: 1, name: 'manager', tel: '111', address: 'tokyo')
    expect(user).to be_valid
  end

  it 'invalid without a factory_id' do
    user = User.new(category_id: nil, name: 'lll', tel: '111', address: 'tokyo')
    user.valid?
    expect(user.errors[:category_id]).to include("是必填项目")
  end

  it 'invalid without a name' do
    user = User.new(category_id: 1, name: nil, tel: '111', address: 'tokyo')
    user.valid?
    expect(user.errors[:name]).to include("是必填项目")
  end

  it 'invalid without a tel' do
    user = User.new(category_id: nil, name: 'lll', tel: '', address: 'tokyo')
    user.valid?
    expect(user.errors[:tel]).to include("是必填项目")
  end

  it 'tel is unique' do
    user = User.create(category_id: 1, name: 'jack', tel: '111', address: 'tokyo')
    user = User.new(category_id: 1, name: 'manager', tel: '111', address: 'tokyo')
    user.valid?
    expect(user.errors[:tel]).to include("已经被使用")
  end

end