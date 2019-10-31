class CityController < ApplicationController
  def show
  	@city = City.find(params[:id])
  	@city_id = @city.id
  	@gossip = Gossip.find(params[:id])
  	@user = User.find(params[:id])
  end

  def index
  	city = City.find(params[:id])
  	city_id = @city.id
  	gossip = Gossip.find(params[:id])
  end
end
