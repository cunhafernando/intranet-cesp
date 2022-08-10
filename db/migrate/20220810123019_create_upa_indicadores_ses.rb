class CreateUpaIndicadoresSes < ActiveRecord::Migration[7.0]
  def change
    create_table :upa_indicadores_ses do |t|
      t.string :codigo
      t.string :indicador
      t.string :meta
      t.string :variavel
      t.string :descricao
      t.string :medida
      t.string :status

      t.timestamps
    end
  end
end
