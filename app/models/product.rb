class Product < ActiveRecord::Base
  attr_accessible :name, :price, :reviews, :body, :image_url

  has_many :reviews,
  :dependent => :destroy
end
