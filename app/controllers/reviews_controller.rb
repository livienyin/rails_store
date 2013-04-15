class ReviewsController < ApplicationController

  before_filter :load_products_in_cart
  def load_products_in_cart
    @products_in_cart = Product.where(:in_cart => true)
  end

  def new
    @review = Review.new
    @product_id = params[:id]
    @product = Product.find(@product_id)
    @products = Product.all

    if @product_id
      @product_name = @products.find{|p| p.id == @product_id.to_i}.name
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  def create
    @review = Review.new(params[:review])
    @products = Product.all
    @product = Product.find(params[:review][:product_id]) 

    respond_to do |format|
      if @review.save
        format.html { redirect_to @product, notice: 'Review was successfully created!' }
        format.json { render json: @review, status: :created, location: @review }
      else
        @product_id = params[:review][:product_id]
        @product = Product.find(@product_id)
        @products = Product.all
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
end
