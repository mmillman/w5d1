class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to product_path(@product)
    else
      flash.now.error = @product.errors.full_messages
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.assign_attributes(params[:product])

    if @product.save
      redirect_to product_path(@product)
    else
      flash.now.error = @product.errors.full_messages
      render :edit
    end
  end

  def destroy
    Product.find(params[:id]).destroy

    redirect_to products_path
  end

end
