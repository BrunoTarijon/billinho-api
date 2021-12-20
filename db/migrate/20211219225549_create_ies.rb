class CreateIes < ActiveRecord::Migration[7.0]
  def change
    create_table :ies do |t|
      t.string :nome
      t.string :cnpj
      t.string :tipo

      t.timestamps
    end
  end
end
