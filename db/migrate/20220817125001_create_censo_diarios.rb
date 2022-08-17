class CreateCensoDiarios < ActiveRecord::Migration[7.0]
  def change
    create_table :censo_diarios do |t|
      t.string :secao
      t.string :leito
      t.string :boletim
      t.string :pulseira
      t.string :prontuario
      t.string :paciente
      t.string :sexo
      t.string :nascimento
      t.string :convenio
      t.string :internacao

      t.timestamps
    end
  end
end
