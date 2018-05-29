class AddressesController < ApplicationController
  def cities
    render json: CS.cities(params[:state], :br)
  end
end
