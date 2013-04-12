class Review < ActiveRecord::Base
  attr_accessible :body, :product_id, :rating, :product
  belongs_to :product

  # validates :body, :length => { :minimum => 50, maximum => 1000 }
  # validates :rating, :in => (0..5)
end
