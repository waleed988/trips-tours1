class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.references :user, null: false, foreign_key: true
      t.string :no_of_persons
      t.references :visitingpoint, null: false, foreign_key: true
      t.references :hotel, null: false, foreign_key: true
      t.references :transport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
