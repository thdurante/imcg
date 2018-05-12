class DashboardsController < ApplicationController
  def index
    flash.now[:notice] = 'Mensagem exemplo de sucesso!'
    render layout: 'authentication'
  end

  def admin
    flash.now[:alert] = 'Mensagem exemplo de erro!'
  end
end
