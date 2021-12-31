class MatriculasController < ApplicationController
  skip_before_action :verify_authenticity_token #Remove csrf_token

  def index
    @matriculas = Matricula.all
    render json: @matriculas
  end

  def show
    @matricula = Matricula.find(params[:id])
    render json: @matricula
  end

  def create
    information = request.raw_post
    data_parsed = JSON.parse(information)

    ie = Ie.find_by nome: data_parsed["ie"]
    aluno = Aluno.find_by nome: data_parsed["aluno"]

    matricula = Matricula.new(
      valor_total: data_parsed["valor_total"],
      qtd_fatura: data_parsed["qtd_fatura"],
      dia_vencimento: data_parsed["dia_vencimento"],
      nome_curso: data_parsed["nome_curso"],
      ie: ie,
      aluno: aluno,
    )
    if matricula.save
      redirect_to "/matricula"
    else
      @errors = matricula.errors.messages
      render json: @errors
    end
  end

  def update
    information = request.raw_post
    data_parsed = JSON.parse(information)

    ie = Ie.find_by nome: data_parsed["ie"]
    aluno = Aluno.find_by nome: data_parsed["aluno"]

    matricula = Matricula.find(params[:id])

    if matricula.update(
      valor_total: data_parsed["valor_total"],
      qtd_fatura: data_parsed["qtd_fatura"],
      dia_vencimento: data_parsed["dia_vencimento"],
      nome_curso: data_parsed["nome_curso"],
      ie: ie,
      aluno: aluno,
    )
      redirect_to "/matricula"
    else
      @errors = matricula.errors.messages
      render json: @errors
    end
  end

  def destroy
    matricula = Matricula.find(params[:id])
    if matricula.destroy
      redirect_to "/matricula"
    else
      @errors = matricula.errors.messages
      render json: @errors
    end
  end
end
