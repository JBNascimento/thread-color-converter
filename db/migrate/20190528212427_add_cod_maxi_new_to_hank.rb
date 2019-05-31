class AddCodMaxiNewToHank < ActiveRecord::Migration[5.2]
  def change
    add_column :hanks, :cod_maxi_new, :string
  end
end
