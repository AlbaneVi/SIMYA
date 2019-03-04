class CustodiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_custodies, only: %i[show edit update]

  def index
    params[:number] ||= 0

    @custodies = Custody.where(day_on: start_date..end_date).sort

    if params[:range] == 'month'
      render :months
    end

    @sender   = current_user
    @receiver = User.where(child_id: current_user.child_id).where.not(id: current_user.id).first
    p "rediriger vers 'inviter l'autre parent" if @receiver.nil?
    @message  = Message.new
    @messages = Message.all
  end

  def show
    @custody = Custody.find(params[:id])
    @media   = @custody.media
  end

  def new
    @custody = Custody.new
  end

  def create
    @custody = Custody.new(custodies_params)
    if @custody.save!
      redirect_to root_path
    else
      render :new
    end

    @message  = Message.new(message_params)
    @user     = User.find(params[:message][:receiver_id])
    if @message.save!
      redirect_to messages_path
    else
      @message
    end
  end

  def edit
    @day_on = @custody.day_on
  end

  def update
    @custody.update(custodies_params)
    redirect_to custody_path
  end

  private

  def set_custodies
    @custody = Custody.find(params[:id])
  end

  def custodies_params
    params.require(:custody).permit(:title, :text, :day_on, :user)
  end

  def message_params
    params.require(:message).permit(:body, :sender_id, :receiver_id)

  def start_date
    if params[:range] == 'month'
      current_monday
    else
      current_monday + (7 * params[:number].to_i).day
    end
  end

  def end_date
    if params[:range] == 'month'
      current_monday + 1.month
    else
      start_date + 6.day
    end
  end

  def current_monday
    Date.parse("Monday").to_time
  end
end
