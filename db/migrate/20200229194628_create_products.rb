class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.float :price
      t.string :code
      t.string :bar_code
      t.string :manufacturer
      t.string :model
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
