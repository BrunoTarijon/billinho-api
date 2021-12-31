class CreateFaturas < ActiveRecord::Migration[7.0]
  def change
    create_table :faturas do |t|
      t.decimal :valor_fatura
      t.date :data_vencimento
      t.references :matricula, null: false, foreign_key: { to_table: :matriculas }
      t.string :status

      t.timestamps
    end
  end
end
