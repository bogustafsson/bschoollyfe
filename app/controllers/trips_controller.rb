class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @user = User.new
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    @trip.user_id = current_user.id
    @trip.image = params[:image]
    @trip.minimum_number_of_participants = params[:minimum_number_of_participants]
    @trip.description = params[:description]
    @trip.estimated_cost = params[:estimated_cost]
    @trip.date = Chronic.parse(params[:date])
    @trip.location = params[:location]
    @trip.title = params[:title]

    if @trip.save
      redirect_to "/trips", :notice => "Trip created successfully."
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update

    @trip = Trip.find(params[:id])

    @trip.user_id = current_user.id
    @trip.image = params[:image]
    @trip.minimum_number_of_participants = params[:minimum_number_of_participants]
    @trip.description = params[:description]
    @trip.estimated_cost = params[:estimated_cost]
    @trip.date = Chronic.parse(params[:date])
    @trip.location = params[:location]
    @trip.title = params[:title]

    if @trip.user_id == current_user.id
      @trip.save
      redirect_to "/trips", :notice => "Trip updated successfully."
    else
      redirect_to "/trips", :notice => "You can't edit trips not created by you."
    end
  end

  def create_participant
    @trip = Trip.find(params[:id])
    @participant = Participant.new
    @participant.user_id = current_user.id
    @participant.trip_id = params[:id]

    if @participant.save
      redirect_to "/participants", :notice => "Participant created successfully."
    else
      render 'new'
    end
  end

  def confirmed_participants
    @trip = Trip.find(params[:id])
    @participant = Participant.find(params[:id])
  end

  def destroy
    @trip = Trip.find(params[:id])
    if @trip.user_id == current_user.id
      @trip.destroy
      redirect_to "/trips", :notice => "Trip updated successfully."
    else
      redirect_to "/trips", :notice => "You can't delete trips not created by you."
    end
  end
end
