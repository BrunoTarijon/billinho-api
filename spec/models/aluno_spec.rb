require 'rails_helper'

RSpec.describe Aluno, type: :model do

  it "doest save without (nome, cpf, genero, tipo_pagamento)" do 
    aluno = Aluno.new( 
      nome: nil, 
      cpf: nil, 
      data_nascimento: Date.strptime('03-02-2001', '%d-%m-%Y'), 
      telefone: 11986123798,
      genero: nil,
      tipo_pagamento: nil)
    aluno.valid?

    expect(aluno.errors[:nome]).to include ("Nome nao pode ser vazio") 
    expect(aluno.errors[:cpf]).to include ("CPF nao pode ser vazio") 
    expect(aluno.errors[:genero]).to include ("Genero nao pode ser vazio") 
    expect(aluno.errors[:tipo_pagamento]).to include ("Tipo de pagamento nao pode ser vazio") 
  end


  it "(name, cpf) must be unique" do 
    aluno1 = Aluno.new( 
      nome: "Brunin", 
      cpf: '123091283', 
      data_nascimento: Date.strptime('03-02-2001', '%d-%m-%Y'), 
      telefone: 11986123798,
      genero: 'M',
      tipo_pagamento: 'Boleto')
    aluno1.save
    aluno2 = Aluno.new( 
      nome: "Brunin", 
      cpf: '123091283', 
      data_nascimento: Date.strptime('03-02-2001', '%d-%m-%Y'), 
      telefone: 11986123798,
      genero: 'M',
      tipo_pagamento: 'Boleto')
    aluno2.save
    expect(aluno2.errors[:nome]).to include ("Nome deve ser unico")
    expect(aluno2.errors[:cpf]).to include ("CPF deve ser unico")
  end


  it "(CPF, genero, tipo_pagamento) have valid type" do 
    aluno = Aluno.new( 
      nome: "Brunin", 
      cpf: '12309asd3', 
      data_nascimento: Date.strptime('03-02-2001', '%d-%m-%Y'), 
      telefone: 11986123798,
      genero: 'cavalo',
      tipo_pagamento: 'balas')
    aluno.save
    expect(aluno.errors[:cpf]).to include ("CPF deve conter somente numeros") 
    expect(aluno.errors[:genero]).to include ("Genero deve conter somente M ou F") 
    expect(aluno.errors[:tipo_pagamento]).to include ("Tipo de pagamento deve ser ou Boleto ou Cartao") 
  end
end
