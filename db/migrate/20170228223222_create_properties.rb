class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :lol3
      t.string :unit
      t.string :group
      t.string :tenantid
      t.string :resident_name
      t.integer :resident_rent
      t.integer :unit_rent
      t.string :status
      t.integer :days_vacant
      t.date :move_out
      t.date :lease_to
      t.string :amenities
      t.integer :amenities_amount
      t.integer :discounts
      t.references :company, foreign_key: true
      t.references :unit_type, foreign_key: true

      t.timestamps
    end
  end
end
