require "rails_helper"

RSpec.describe Matricula, type: :model do
  it "doest save without any field" do
    aluno, ie = create_aluno_ie()

    matricula = Matricula.new(
      valor_total: nil,
      qtd_fatura: nil,
      dia_vencimento: nil,
      nome_curso: nil,
      ie: nil,
      aluno: nil,
    )

    matricula.valid?

    expect(matricula.errors[:valor_total]).to include ("Valor Total nao pode ser vazio")
    expect(matricula.errors[:qtd_fatura]).to include ("Quantidades de fatura nao pode ser vazio")
    expect(matricula.errors[:dia_vencimento]).to include ("Dia de vencimento nao pode ser vazio")
    expect(matricula.errors[:nome_curso]).to include ("Nome do curso nao pode ser vazio")
    expect(matricula.errors[:ie]).to include ("IE nao pode ser vazio")
    expect(matricula.errors[:aluno]).to include ("ALUNO de pagamento nao pode ser vazio")
  end

  it "doest save with invalid values in (valor_total, qtd_fatura, dia_vencimento)" do
    aluno, ie = create_aluno_ie()
    matricula1 = Matricula.new(
      valor_total: -5,
      qtd_fatura: 0,
      dia_vencimento: 0,
      nome_curso: "Pro player de cozinha",
      ie: ie,
      aluno: aluno,
    )
    matricula2 = Matricula.new(
      valor_total: 25.6,
      qtd_fatura: 10,
      dia_vencimento: 35,
      nome_curso: "Pro player de cozinha",
      ie: ie,
      aluno: aluno,
    )
    matricula1.valid?
    matricula2.valid?

    print(matricula1.errors.messages)
    expect(matricula1.errors[:valor_total]).to include ("Valor Total nao pode ser menor ou igual a 0")
    expect(matricula1.errors[:qtd_fatura]).to include ("Quantidade de fatura nao pode ser menor que 1")
    expect(matricula1.errors[:dia_vencimento]).to include ("Dia de vencimento nao pode ser menor que 1 ou maior que 31")
    expect(matricula2.errors[:dia_vencimento]).to include ("Dia de vencimento nao pode ser menor que 1 ou maior que 31")
  end

  private

  def create_aluno_ie()
    aluno = Aluno.new(
      nome: "Brunin",
      cpf: "0127398127",
      data_nascimento: Date.strptime("03-02-2001", "%d-%m-%Y"),
      telefone: 11986123798,
      genero: "M",
      tipo_pagamento: "Boleto",
    )
    aluno.save

    ie = Ie.new(nome: "Faculdade Unica",
                cnpj: "12345678910",
                tipo: "Universidade")

    ie.save
    return aluno, ie
  end
end
