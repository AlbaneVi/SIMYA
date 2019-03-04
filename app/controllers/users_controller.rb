class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_users, only: [:show, :edit]

  def show
  end

  def edit
    #set_users
  end

  private

  def set_users
    @user = User.find(params[:id])
  end
end
