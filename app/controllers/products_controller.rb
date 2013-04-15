class ProductsController < ApplicationController
  # GET /products
  # GET /products.json

  before_filter :load_products_in_cart
  def load_products_in_cart
    @products_in_cart = Product.where(:in_cart => true)
  end

  before_filter :find_product, :except => [:index, :new, :create, :view_cart]
  def find_product
    @product = Product.find(params[:id])
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
    @review = Review.new
    @reviews = Review.where(:product_id => @product.id)
    @products = Product.all

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
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
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
  
  def view_cart
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def add_to_cart
    @product.update_attributes({:in_cart => true})

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Product was successfully added to cart.' }
      format.json { head :no_content }
    end
  end

   def remove_from_cart
     @product.update_attributes({:in_cart => false})

     respond_to do |format|
       format.html { redirect_to :back, notice: 'Product was successfully removed.' }
       format.json { head :no_content }
     end
   end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
