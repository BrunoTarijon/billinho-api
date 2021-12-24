class CreateAlunos < ActiveRecord::Migration[7.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :cpf
      t.date :data_nascimento
      t.integer :telefone
      t.string :genero
      t.string :tipo_pagamento

      t.timestamps
    end
  end
end
