class User < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :category

  validates :category_id, :name, :tel, :address, presence: true
  validates :tel, uniqueness: true

end
