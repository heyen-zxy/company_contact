class Category < ActiveRecord::Base
  acts_as_paranoid
  acts_as_nested_set
  validates :name, presence: true
  has_many :users
end
