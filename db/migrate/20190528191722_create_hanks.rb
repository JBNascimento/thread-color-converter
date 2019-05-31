class CreateHanks < ActiveRecord::Migration[5.2]
  def change
    create_table :hanks do |t|
      t.string :name
      t.string :cod_anchor
      t.string :cod_dmc
      t.string :cod_maxi

      t.timestamps
    end
  end
end
