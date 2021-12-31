class Matricula < ApplicationRecord
  belongs_to :ie, class_name: "Ie"
  belongs_to :aluno, class_name: "Aluno"

  # Presence
  validates :valor_total, presence: { message: "Valor Total nao pode ser vazio" }
  validates :qtd_fatura, presence: { message: "Quantidades de fatura nao pode ser vazio" }
  validates :dia_vencimento, presence: { message: "Dia de vencimento nao pode ser vazio" }
  validates :nome_curso, presence: { message: "Nome do curso nao pode ser vazio" }
  validates :ie, presence: { message: "IE nao pode ser vazio" }
  validates :aluno, presence: { message: "ALUNO de pagamento nao pode ser vazio" }

  # Value
  validates :valor_total, comparison: { greater_than: 0, message: "Valor Total nao pode ser menor ou igual a 0" }
  validates :qtd_fatura, comparison: { greater_than: 0, message: "Quantidade de fatura nao pode ser menor que 1" }
  validates :dia_vencimento, comparison: { greater_than: 0, less_than_or_equal_to: 31,
                                           message: "Dia de vencimento nao pode ser menor que 1 ou maior que 31" }

  has_many :matricula_fatura, class_name: "Fatura", foreign_key: "matricula_id"
end
