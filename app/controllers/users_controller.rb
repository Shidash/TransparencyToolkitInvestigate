class UsersController < ApplicationController
  before_filter :signed_in_restrict, only: [:edit, :update, :destroy]
  before_filter :right_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def portal
    @user = User.find(params[:id])
    @tasks = Task.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Transparency Toolkit!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User information updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to root_path
  end

  private

  def signed_in_restrict
    unless signed_in?
      save_location
      flash[:notice] = "Please login."
      redirect_to signin_url
    end
  end

  def right_user
    @user = User.find(params[:id])
    redirect_to :back, notice: "You can't edit another user's information." unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
    flash[:notice] = "You need to be an administrator to complete that action."
  end
end
