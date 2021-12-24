class Ie < ApplicationRecord
    validates :nome, presence: { message: "Nome nao pode ser vazio" }
    validates :nome, uniqueness: { message: "Nome deve ser unico" }

    validates :cnpj, presence: { message:"CNPJ nao pode ser vazio" }
    validates :cnpj, uniqueness: { message: "CNPJ deve ser unico" }

    validates :tipo, inclusion: { in: %w(Universidade Escola Creche),
        message: "%{value} nao eh um tipo válido" }

end
