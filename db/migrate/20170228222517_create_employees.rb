class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
