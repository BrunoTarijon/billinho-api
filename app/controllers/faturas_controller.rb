class FaturasController < ApplicationController
  skip_before_action :verify_authenticity_token #Remove csrf_token

  def index
    @faturas = Fatura.all
    render json: @faturas
  end

  def show
    @fatura = Fatura.find(params[:id])
    render json: @fatura
  end
end
