require 'rails_helper'

describe Ie do
  # Nome
  it "doest save without name" do 
    ie = Ie.new( nome: nil, 
     cnpj: '123091283', 
     tipo: 'Universidade' ) 
    ie.valid?
    expect(ie.errors[:nome]).to include ("Nome nao pode ser vazio") 
  end 
  
  it "name must be unique" do 
    ie1 = Ie.new( nome: "Faculdade Unica", 
      cnpj: '12345678910', 
      tipo: 'Universidade' )
    ie1.save
    ie2 = Ie.new( nome: "Faculdade Unica", 
     cnpj: '12345678910', 
     tipo: 'Universidade' ) 
    ie2.valid?
    expect(ie2.errors[:nome]).to include ("Nome deve ser unico") 
  end 

  # CNPJ
  it "doest save without cnpj" do 
    ie = Ie.new( nome: "Unip", 
     cnpj: nil, 
     tipo: 'Universidade' ) 
    ie.valid?
    expect(ie.errors[:cnpj]).to include ("CNPJ nao pode ser vazio") 
  end
  
  it "cnpj must be unique" do 
    ie1 = Ie.new( nome: "Faculdade Unica", 
      cnpj: '12345678910', 
      tipo: 'Universidade' )
    ie1.save
    ie2 = Ie.new( nome: "Faculdade Unica", 
     cnpj: '12345678910', 
     tipo: 'Universidade' ) 
    ie2.valid?
  expect(ie2.errors[:cnpj]).to include ("CNPJ deve ser unico") 
  end

  # Tipo
  it "dont save with invalid type" do 
    ie = Ie.new( nome: "Unifesp", 
     cnpj: "1298391263", 
     tipo: 'Pamonha' ) 
    ie.valid?
    expect(ie.errors[:tipo]).to include ("Pamonha nao eh um tipo válido") 
  end
end
