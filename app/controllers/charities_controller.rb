class CharitiesController < ApplicationController
  before_action :set_charity, only: [:edit, :update]
  before_action :authenticate_user!

  def new
    @charity = Charity.new
  end

  def create
    @charity = current_user.charities.build(charity_params)
    if @charity.save
      redirect_to @charity, notice: 'Charity was successfully created.'
    else
      render :new
    end
  end

  def update
    if @charity.update(charity_params)
      redirect_to @charity, notice: 'Charity was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_charity
    @charity = Charity.find(params[:id])
  end

  def charity_params
    params.require(:charity).permit(:name, :description, :logo, :contact_email, :phone_number)
  end
end
