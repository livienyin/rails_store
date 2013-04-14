class ReviewsController < ApplicationController

  def create
    @review = Review.new(params[:review])
    @products = Product.all
  
    respond_to do |format|
      if @review.save
        format.html { redirect_to :back, notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
end
