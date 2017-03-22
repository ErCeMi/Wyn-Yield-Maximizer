class CreateUnitTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :unit_types do |t|
      t.string :lol2
      t.string :unit_type
      t.string :bedroom
      t.integer :amount_off
      t.float :percentage_off
      t.float :growth_rate
      t.references :property_name, foreign_key: true

      t.timestamps
    end
  end
end
