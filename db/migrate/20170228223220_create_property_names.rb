class CreatePropertyNames < ActiveRecord::Migration[5.0]
  def change
    create_table :property_names do |t|
      t.string :lol1
      t.string :name
      t.string :lease_terms


      t.timestamps
    end
  end
end
