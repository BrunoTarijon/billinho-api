class Fatura < ApplicationRecord
  belongs_to :matricula, class_name: "Matricula"

  validates :valor_fatura, presence: { message: "Valor Total nao pode ser vazio" }
  validates :data_vencimento, presence: { message: "Dia de vencimento nao pode ser vazio" }
  validates :matricula, presence: { message: "Matricula nao pode ser vazio" }
  validates :status, presence: { message: "Status da fatura nao pode ser vazio" }

  validates :status, inclusion: { in: %w(Aberta Atrasada Paga),
                                  message: "Status da fatura tem um valor invalido" }
  attribute :status, :string, default: "Aberta"
end
