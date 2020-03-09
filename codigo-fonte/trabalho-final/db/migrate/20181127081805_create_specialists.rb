class CreateSpecialists < ActiveRecord::Migration[5.2]
  def change
    create_table :specialists do |t|
      t.string :name
      t.string :phone
      t.references :specialty, foreign_key: true

      t.timestamps
    end
  end
end
