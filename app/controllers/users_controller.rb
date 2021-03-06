class UsersController < ApplicationController
  def signup
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="Welcome to alpha blog #{@user.username}"
      redirect_to users_path
    else
      render 'signup'
    end
  end
  
  def index
    @users= User.paginate(page:params[:page], per_page:2)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success]="User was updated successfully"
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success]="User was deleted"
    redirect_to users_path
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end