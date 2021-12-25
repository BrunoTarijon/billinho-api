class CreateMatriculas < ActiveRecord::Migration[7.0]
  def change
    create_table :matriculas do |t|
      t.decimal :valor_total
      t.integer :qtd_fatura
      t.integer :dia_vencimento
      t.string :nome_curso
      t.references :ie, null: false, foreign_key: { to_table: :ies }
      t.references :aluno, null: false, foreign_key: { to_table: :alunos }

      t.timestamps
    end
  end
end
