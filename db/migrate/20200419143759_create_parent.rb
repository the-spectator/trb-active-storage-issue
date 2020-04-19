class CreateParent < ActiveRecord::Migration[6.0]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :gender
      t.string :mobile_number
      t.date :date_of_birth

      t.timestamps
    end
  end
end
