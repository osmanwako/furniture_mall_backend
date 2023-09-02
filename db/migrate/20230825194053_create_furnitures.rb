class CreateFurnitures < ActiveRecord::Migration[7.0]
  def change
    create_table :furnitures do |t|
      t.string :name
      t.string :serial_number
      t.string :image, default: "furniture.png"
      t.text :description
      t.decimal :upfront_price, default: nil, precision: 10, scale: 2
      t.decimal :total_price, default: nil, precision: 10, scale: 2
      t.integer :warranty_year,default: 0
      t.integer :status, default: 0
      t.references :user, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
