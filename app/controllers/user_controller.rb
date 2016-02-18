class UserController < ApplicationController
  def index
    @users= User.all
    # ^all users
  end
  def new
    @user= User.new
    # ^new user form. empty shell of what user should look like
  end
  def create
    if @user = User.create(user_params)
      redirect_to users_path
      # ^when you hit the submit button on new user form (users/new.html.erb) the stuff below happens
      else
        redirect_to new_user_path
    end
  end
  def show
    @user = User.find(params[:id])
    # ^one instance of a user
  end
  def edit
    @user = User.find(params[:id])
    # ^one instance of a user
  end
  def update
     if @user = User.find(params[:id])
       @user.update_attributes(user_params)
      #  ^when you find them by the params we set in the model (if you entered a quarter not a dime)
      redirect_to user_path(@user)
      # ^then we will send you to the users/user_id path (OF THAT USER!!! BY THE PARAMS!!!)
      else
        # ^if you don't enter your info in all the fields/its not long enough or whatever validations I set
        redirect_to edit_user_path(@user)
        # ^stay where you are until you fix your inputs to coincide with my user params
      end
  end
  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_path
  end
private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
