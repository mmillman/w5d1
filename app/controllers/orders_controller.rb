class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])

    if @order.save
      redirect_to order_path(@order)
    else
      flash.now.error = @order.errors.full_messages
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.assign_attributes(params[:order])

    if @order.save
      redirect_to order_path(@order)
    else
      flash.now.error = @order.errors.full_messages
      render :edit
    end
  end

  def destroy
    Order.find(params[:id]).destroy

    redirect_to orders_path
  end
end
