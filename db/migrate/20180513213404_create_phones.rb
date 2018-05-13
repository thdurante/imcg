class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :number
      t.string :kind
      t.references :person, foreign_key: true

      t.timestamps
    end

    add_index :phones, [:person_id, :number], unique: true
  end
end
