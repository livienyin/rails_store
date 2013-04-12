module ProductsHelper

  def price_total
    sum = 0
      @products_in_cart.each do |product|
        sum += product.price
      end 
    number_to_currency(sum)
  end
  
end
