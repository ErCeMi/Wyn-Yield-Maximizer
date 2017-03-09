class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :lol
      t.string :name
      t.string :unit
      t.string :unit_type
      t.integer :bedroom
      t.string :group
      t.string :tenantid
      t.string :resident_name
      t.integer :resident_rent
      t.integer :unit_rent
      t.integer :discount
      t.string :status
      t.integer :days_vacant
      t.date :move_in
      t.date :move_out
      t.date :lease_from
      t.date :lease_to
      t.string :amenities
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
