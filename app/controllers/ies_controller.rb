class IesController < ApplicationController
  skip_before_action :verify_authenticity_token #Remove csrf_token

  def index
    @ies = Ie.all
    render json: @ies
  end

  def show
    @ie = Ie.find(params[:id])
    render json: @ie
  end

  def create
    information = request.raw_post
    data_parsed = JSON.parse(information)
    ie = Ie.new(nome: data_parsed["nome"], cnpj: data_parsed["cnpj"], tipo: data_parsed["tipo"])
    if ie.save
      redirect_to "/ies"
    else
      @errors = ie.errors.messages
      render json: @errors
    end
  end

  def update
    information = request.raw_post
    data_parsed = JSON.parse(information)

    ie = Ie.find(params[:id])

    if ie.update(nome: data_parsed["nome"], cnpj: data_parsed["cnpj"], tipo: data_parsed["tipo"])
      redirect_to "/ies"
    else
      @errors = ie.errors.messages
      render json: @errors
    end
  end

  def destroy
    ie = Ie.find(params[:id])
    if ie.destroy
      redirect_to "/ies"
    else
      @errors = ie.errors.messages
      render json: @errors
    end
  end
end
