class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      t.datetime :date
      t.string :status
      t.string :note
      t.references :patient, foreign_key: true
      t.references :specialist, foreign_key: true

      t.timestamps
    end
  end
end
