class RestaurantController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.find(restaurant_params)
    if @restaurant.save
      #homepage
    else
      flash[:errors] = "This restaurant doesn't seem to exist"
      #stay on photo saving page
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

end
