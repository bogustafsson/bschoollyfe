class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def new
    @participant = Participant.new
  end

  def create
    @event = Event.new
    @event.title = params[:title]
    @event.held_on = Chronic.parse(params[:held_on])
    @event.save
  end

  def create
    @participant = Participant.new
    @participant.user_id = params[:user_id]
    @participant.trip_id = params[:trip_id]

    if @participant.save
      redirect_to "/participants", :notice => "Participant created successfully."
    else
      render 'new'
    end
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])

    @participant.user_id = params[:user_id]
    @participant.trip_id = params[:trip_id]

    if @participant.save
      redirect_to "/participants", :notice => "Participant updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @participant = Participant.find(params[:id])

    @participant.destroy

    redirect_to "/participants", :notice => "Participant deleted."
  end
end
