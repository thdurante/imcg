class DashboardsController < ApplicationController
  def index
    flash[:notice] = 'Mensagem de sucesso!'
  end
end
