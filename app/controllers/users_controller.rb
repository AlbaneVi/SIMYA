class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit]

  def profile
    @parent1 = current_user
    @parent2 = current_user.ex_partner
  end

  def edit_profile
    #set_user
  end

  def update
    @parent1.update
    @parent2.update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
