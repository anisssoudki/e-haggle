class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

def index 
    @users = User.all 
    @newest_users = User.last(5)
end

def show 
 
end

def new 
    @user = User.new
end 

def edit
end

def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to e-haggle"
      redirect_to user_path(@user)

    else
     
      render "new"
      flash[:err] = "you have entered incorrect information please try again"
    end
end

def update
  if @user.update(user_params)
    flash[:notice] = "Your account information was successfully updated"
    redirect_to user_path(@user)
  else
    render 'edit'
  end
end

def destroy
  @user.destroy
  # the if statment prevent the session of ending if ur an admin
  session[:user_id] = nil if @user == current_user
  flash[:err] = "Account and all associated Products successfully deleted"
  redirect_to root_path
end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:err] = "You can only edit or delete your own account"
      redirect_to @user
    end

  end
end
