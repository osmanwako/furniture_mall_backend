class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :appoint_date
      t.decimal :total_price, default: nil, precision: 10, scale: 2
      t.decimal :discount_price, default: nil, precision: 10, scale: 2
      t.references :furniture, null: false, foreign_key: true
      t.references :customer, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
