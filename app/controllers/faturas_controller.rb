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

  def update
    information = request.raw_post
    data_parsed = JSON.parse(information)

    fatura = Fatura.find(params[:id])

    if fatura.update(
      status: data_parsed["status"],
    )
      render json: fatura
    else
      @errors = fatura.errors.messages
      render json: @errors
    end
  end
end
