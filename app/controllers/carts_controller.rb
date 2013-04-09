class CartsController < ApplicationController
  def show
    if session[:cart]
      all_ids = session[:cart].split(',')

      @products_with_counts = all_ids.map do |id|
        [Product.find(id), all_ids.count(id)]
      end
    end
  end

  def update
    @product = Product.find(params[:product_id])
    if signed_in?
      session[:cart] = "" unless session[:cart]
      session[:cart] << "#{@product.id},"

      flash[:notice] = "#{ @product.name } added to cart"

    else
      flash[:error] = "Must sign in to add to cart"
    end
    redirect_to product_path(@product)
  end

  def destroy
    if signed_in?
      @product = Product.find(params[:id])

      @products = session[:cart] = ""

      flash.now.notice = "#{ @product.name } added to cart"
    else
      flash.now.error = "Must sign in to add to cart"
    end
  end
end

# where to update cart?
# when calling add to cart, should we be calling update method?
#   and what is the request going to look like?

# is the token created once when signing up or each session?