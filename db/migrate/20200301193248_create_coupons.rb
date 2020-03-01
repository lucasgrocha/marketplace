class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons, id: false do |t|
      t.string :code
      t.integer :discount_amount
      t.integer :discount_type
      t.timestamp :expiration_date
      t.references :category, foreign_key: true

      t.timestamps
    end

    execute "ALTER TABLE coupons ADD PRIMARY KEY (code);"
  end
end
