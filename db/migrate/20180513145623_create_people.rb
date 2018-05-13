class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :email
      t.boolean :member, default: false
      t.string :occupation

      t.timestamps
    end

    add_index :people, :cpf, unique: true
  end
end
