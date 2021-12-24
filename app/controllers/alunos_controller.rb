class AlunosController < ApplicationController
  skip_before_action :verify_authenticity_token #Remove csrf_token
  def index
    @alunos = Aluno.all
    respond_to do |format|
      format.json
    end
  end

  def show
    @aluno = Aluno.find(params[:id])
  end

  def create
    information = request.raw_post
    data_parsed = JSON.parse(information)
    aluno = Aluno.new( 
      nome: data_parsed['nome'], 
      cpf: data_parsed['cpf'], 
      data_nascimento: Date.strptime(data_parsed['data_nascimento'], '%d/%m/%Y'), 
      telefone: data_parsed['telefone'],
      genero: data_parsed['genero'],
      tipo_pagamento: data_parsed['tipo_pagamento'])
    if aluno.save
      redirect_to '/alunos'
    else
      @errors = aluno.errors.messages
      respond_to do |format|
        format.json
      end
    end
  end

  def update
    information = request.raw_post
    data_parsed = JSON.parse(information)

    aluno = Aluno.find(params[:id])

    if aluno.update(
      nome: data_parsed['nome'], 
      cpf: data_parsed['cpf'], 
      data_nascimento: Date.strptime(data_parsed['data_nascimento'], '%d/%m/%Y'), 
      telefone: data_parsed['telefone'],
      genero: data_parsed['genero'],
      tipo_pagamento: data_parsed['tipo_pagamento'])
      
      redirect_to '/alunos'
    else
      @errors = aluno.errors.messages
      respond_to do |format|
        format.json
      end
    end
  end

  def destroy
    aluno = Aluno.find(params[:id])
    if aluno.destroy
      redirect_to "/alunos"
    else
      @errors = aluno.errors.messages
      respond_to do |format|
        format.json
      end
    end
  end
end
