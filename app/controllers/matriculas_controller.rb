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
      render json: matricula
    else
      @errors = matricula.errors.messages
      render json: @errors
      return
    end

    # Populate fatura
    today = Time.zone.now.to_date
    if today.mday < data_parsed["dia_vencimento"].to_i
      fatura_init_date = Date.new(today.year, today.month, data_parsed["dia_vencimento"].to_i)
    else
      fatura_init_date = Date.new(today.year, today.next_month.month, data_parsed["dia_vencimento"].to_i)
    end
    fatura_date = fatura_init_date
    for i in 1..data_parsed["qtd_fatura"].to_i
      fatura = Fatura.new(
        valor_fatura: data_parsed["valor_total"].to_f / data_parsed["qtd_fatura"].to_i,
        data_vencimento: fatura_date,
        matricula: matricula,
        status: "Aberta",
      )
      fatura.save
      if fatura_date.month == 2
        fatura_date = Date.new(fatura_date.year, 3, data_parsed["dia_vencimento"].to_i)
      else
        fatura_date = fatura_date.next_month
      end
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
      render json: matricula
    else
      @errors = matricula.errors.messages
      render json: @errors
    end
  end

  def destroy
    matricula = Matricula.find(params[:id])
    if matricula.destroy
      render json: matricula
    else
      @errors = matricula.errors.messages
      render json: @errors
    end
  end
end
