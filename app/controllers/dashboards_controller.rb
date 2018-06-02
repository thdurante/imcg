class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    flash.now[:notice] = 'Mensagem exemplo de sucesso!'
    render layout: 'authentication'
  end

  def admin
    flash.now[:alert] = 'Mensagem exemplo de erro!'
  end
end
