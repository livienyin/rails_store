class Product < ActiveRecord::Base
  attr_accessible :name, :price, :reviews, :body, :in_cart, :image_url

  has_many :reviews,
  :dependent => :destroy
  
  validates_uniqueness_of :name
  validates_presence_of :name
  validates_presence_of :price
end
