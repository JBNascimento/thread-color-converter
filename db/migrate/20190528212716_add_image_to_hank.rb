class AddImageToHank < ActiveRecord::Migration[5.2]
  def change
    add_column :hanks, :image, :string
  end
end
