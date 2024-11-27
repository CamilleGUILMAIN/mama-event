class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
  end

  def show
    @participant = participant.find(params(:id))
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
