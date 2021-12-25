class Aluno < ApplicationRecord
  # Presence
  validates :nome, presence: { message: "Nome nao pode ser vazio" }
  validates :cpf, presence: { message: "CPF nao pode ser vazio" }
  validates :genero, presence: { message: "Genero nao pode ser vazio" }
  validates :tipo_pagamento, presence: { message: "Tipo de pagamento nao pode ser vazio" }

  # Uniqueness
  validates :nome, uniqueness: { message: "Nome deve ser unico" }
  validates :cpf, uniqueness: { message: "CPF deve ser unico" }

  # Type
  validates :cpf, format: { with: /\A\d+\z/, message: "CPF deve conter somente numeros" }
  validates :genero, inclusion: { in: %w(M F),
                                  message: "Genero deve conter somente M ou F" }
  validates :tipo_pagamento, inclusion: { in: %w(Boleto Cartao),
                                          message: "Tipo de pagamento deve ser ou Boleto ou Cartao" }

  has_many :aluno_matriculas, class_name: "Matricula", foreign_key: "aluno_id"
end
