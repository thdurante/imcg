class AddressesController < ApplicationController
  skip_before_action :authenticate_user!

  def cities
    render json: CS.cities(params[:state], :br)
  end
end
