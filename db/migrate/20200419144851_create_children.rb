class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.string :name
      t.string :gender
      t.date :date_of_birth
      t.references :parent, foreign_key: true, index: true

      t.timestamps
    end
  end
end
