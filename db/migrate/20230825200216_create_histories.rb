class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.string :name
      t.string :image
      t.string :type
      t.string :serial_number
      t.string :discount_price
      t.string :upfront_price
      t.string :total_price
      t.string :size
      t.string :customer_name
      t.string :customer_id
      t.string :warrant_year

      t.timestamps
    end
  end
end
