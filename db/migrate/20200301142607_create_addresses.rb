class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_line
      t.string :zip_code
      t.string :city
      t.integer :building_number
      t.string :neighborhood
      t.string :state
      t.string :country
      t.string :datails
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
