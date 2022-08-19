class CreatePacientes < ActiveRecord::Migration[7.0]
  def change
    create_table :pacientes do |t|
      t.string :risco
      t.string :tipo_entrada
      t.string :profissional
      t.string :especialidade
      t.string :linha_cuidado
      t.string :boletim
      t.string :entrada
      t.string :classificacao
      t.string :encaminhamento
      t.string :atendimento_primeira
      t.string :inicio_atendimento
      t.string :fim_atendimento
      t.string :alta
      t.string :nome
      t.string :idade
      t.string :sexo
      t.string :raca
      t.float :tm_atendimento
      t.float :tm_cr
      t.float :tm_classxatend
      t.string :meta
      t.string :cod_diag
      t.string :diagnostico
      t.string :tipo_problema
      t.string :motivo_alta
      t.string :bairro
      t.string :municipio
      t.string :convenio
      t.string :numero_sisreg

      t.timestamps
    end
  end
end
