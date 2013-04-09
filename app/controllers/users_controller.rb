class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.email.downcase! if @user.email

    if @user.save
      redirect_to user_path(@user)
    else
      flash.now.error = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    @user.email.downcase! if @user.email

    if @user.save
      redirect_to user_path(@user)
    else
      flash.now.error = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy

    redirect_to users_path
  end

  def checkout
    @user = User.find(params[:user_id])

    @products = Product.find(session[:cart])

    @order = Order.new
  end

end
