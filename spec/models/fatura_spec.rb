require "rails_helper"

RSpec.describe Fatura, type: :model do
  it "doest save without any field" do
    fatura = Fatura.new(
      valor_fatura: nil,
      data_vencimento: nil,
      matricula: nil,
      status: nil,
    )

    fatura.valid?

    expect(fatura.errors[:valor_fatura]).to include ("Valor Total nao pode ser vazio")
    expect(fatura.errors[:data_vencimento]).to include ("Dia de vencimento nao pode ser vazio")
    expect(fatura.errors[:matricula]).to include ("Matricula nao pode ser vazio")
    expect(fatura.errors[:status]).to include ("Status da fatura nao pode ser vazio")
  end

  it "doest save with invalid values in status" do
    fatura = Fatura.new(
      valor_fatura: nil,
      data_vencimento: nil,
      matricula: nil,
      status: "Vai dar certo",
    )

    fatura.valid?

    expect(fatura.errors[:status]).to include ("Status da fatura tem um valor invalido")
  end
end
