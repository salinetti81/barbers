class BarbersController < ApplicationController
  before_action :set_barber, only: [:show, :edit, :update, :destroy]

  def index
    @barber = Barber.all
  end

  def show
  end

  def new
    # Car.new instantiates a new instance but does not save it.
    # You can call .save onto it to save onto the db later
    # .create instantiates and auto saves all in one. Here' we don't want to save it.
    # We want to create a blank instance to throw into the form for the user to populate with values
    @barber = Barber.new
  end

  def edit
    # Normally I have to create @car here but the set_car method is already does that
    # It's also being called automatically via before_action on the specified actions
  end


  def create
    # I use conditionals to handle in the event the save doesn't happen. If so, we'll redirect back to the new to restart the process
    @barber = Barber.new(barber_params)

    if @barber.shop
      @barber.shop = @barber.shop.to_i
    end

    if @barber.save
      redirect_to @barber
    else
      render :action => :new
    end
  end

  def update
    # Same use of conditionals
    if barber_params[:shop]
      barber_params[:shop] = barber_params[:shop].to_i
    end

    if @barber.update(barber_params)
      redirect_to @barber
    else
      render :action => :edit
    end
  end

  def destroy
    @barber.destroy
    redirect_to barbers_url
  end

  private
  # private methods for strong params
  # set car is basically a helper method that I use to find a specific id. It's called automatically by my before_action on the routes that require an id
  def set_barber
    @barber = Barber.find(params[:id])
  end

  # more strong params stuff
  def barber_params
    params.require(:barber).permit(:name, :shop)
  end


end