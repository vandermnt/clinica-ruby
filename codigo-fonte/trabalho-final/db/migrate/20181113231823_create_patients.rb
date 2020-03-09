class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :cpf
      t.date :age
      t.string :telefone
      t.string :email
      t.string :address
      t.string :profession

      t.timestamps
    end
  end
end
