class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def profile
    @parent1 = current_user
    @parent2 = current_user.fixed_ex_partner
  end

  def edit_profile
    @parent1 = current_user
  end

  def update
    @parent1 = current_user.update(users_params)
    redirect_to profile_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar)
  end
end
