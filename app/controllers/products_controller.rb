class ProductsController < ApplicationController
  # GET /products
  # GET /products.json

  before_filter :load_products_in_cart, :only => [:index, :show]
  def load_products_in_cart
    @products_in_cart = Product.where(:in_cart => 't')
  end

  def index
    @products = Product.all
    @product = Product.new


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product_id = params[:id]
    @product = Product.find(@product_id)
    @review = Review.new
    @reviews = Review.where(:product_id => @product_id)
    @products = Product.all
    # if !@product_id.nil?
    #   @product_name = @products.find{|p| p.id == @product_id.to_i}.name
    # end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @id = params[:id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def add_to_cart
    @product = Product.find(params[:id])
    @product[:in_cart] = 't'

    # @product.update_attributes({:in_cart => true})
    # OR
    # @product.in_cart = true
    # @product.save

    respond_to do |format|
      @product.update_attributes(params[:product])
      format.html { redirect_to products_url, notice: 'Product was successfully added to cart.' }
      format.json { head :no_content }
    end
  end

  # def remove_from_cart
  #   @product = Product.find(params[:id])
  #   @product[:in_cart] = 'f'

  #   respond_to do |format|
  #     @product.update_attributes(params[:product])
  #     format.html { redirect_to products_url, notice: 'Product was successfully removed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
