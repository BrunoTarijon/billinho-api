class IesController < ApplicationController
  skip_before_action :verify_authenticity_token #Remoce csrf_token

  def index
    @ies = Ie.all
    respond_to do |format|
      format.json
    end
  end

  def show
    @ie = Ie.find(params[:id])
  end

  def create
    information = request.raw_post
    data_parsed = JSON.parse(information)
    ie = Ie.new(nome:data_parsed["nome"], cnpj:data_parsed["cnpj"], tipo:data_parsed["tipo"])
    if ie.save
      redirect_to '/ies'
    else
      print("Erro ao salvar modelo")
    end
  end

  def update
    information = request.raw_post
    data_parsed = JSON.parse(information)

    ie = Ie.find(params[:id])

    if ie.update(nome:data_parsed["nome"], cnpj:data_parsed["cnpj"], tipo:data_parsed["tipo"])
      redirect_to '/ies'
    else
      print("Erro ao atualizar item")
    end
  end

  def destroy
    ie = Ie.find(params[:id])
    if ie.destroy
      redirect_to "/ies"
    else
      print("Erro ao deletar")
    end
  end
end
