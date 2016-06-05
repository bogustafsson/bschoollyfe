class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @event = Event.new
    @event.title = params[:title]
    @event.held_on = Chronic.parse(params[:held_on])
    @event.save
  end

  def create
    @trip = Trip.new
    @trip.user_id = params[:user_id]
    @trip.image = params[:image]
    @trip.minimum_number_of_participants = params[:minimum_number_of_participants]
    @trip.description = params[:description]
    @trip.estimated_cost = params[:estimated_cost]
    @trip.date = params[:date]
    @trip.location = params[:location]
    @trip.title = params[:title]
    @trip.user_id = params

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

    @trip.user_id = params[:user_id]
    @trip.image = params[:image]
    @trip.minimum_number_of_participants = params[:minimum_number_of_participants]
    @trip.description = params[:description]
    @trip.estimated_cost = params[:estimated_cost]
    @trip.date = params[:date]
    @trip.location = params[:location]
    @trip.title = params[:title]

    if @trip.save
      redirect_to "/trips", :notice => "Trip updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])

    @trip.destroy

    redirect_to "/trips", :notice => "Trip deleted."
  end
end
