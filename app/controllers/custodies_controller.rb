class CustodiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_custodies, only: %i[show edit update switch]

  def index
    params[:number] ||= 0

    @custodies = Custody.where(day_on: start_date..end_date).sort
    @custody_today = Custody.where(day_on: Date.today)[0]

    render :months if params[:range] == 'month'

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
      redirect_to custody_path(@custody.day_on.day)
    else
      render :new
    end
  end

  def edit
    @image = @custody.media.build
    @number = params[:number]
  end

  def update
    if @custody.update(custodies_params)
      if params[:custody][:media].present?
        params[:custody][:media].each do |image|
          @image = @custody.media.create!(photo: image)
        end
      end
      redirect_to custodies_path(number: params[:custody][:number], anchor: "custody#{@custody.id}")
    else
      render :edit
    end
  end

  # PATCH /custodies/:id/switch
  def switch
    @custody.switch
    redirect_back(fallback_location: custodies_path)
  end

  private

  def set_custodies
    @custody = Custody.find(params[:id])
  end

  def custodies_params
    params.require(:custody)
          .permit(:title,
                  :text,
                  :day_on,
                  :user_id,
                  media_attributes: [:photo])
  end

  def start_date
    if params[:range] == 'month'
      current_monday
    else
      current_monday + (7 * params[:number].to_i).day
    end
  end

  def end_date
    if params[:range] == 'month'
      current_monday + 27.day
    else
      start_date + 6.day
    end
  end

  def current_monday
    Date.parse("Monday").to_time
  end

  # def number_for_custody
  #   ((@custody.day_on - Date.parse("sunday")) / 7).to_i - 1
  # end
end
