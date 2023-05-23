class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :category
      t.string :price_per_night
      t.string :location

      t.timestamps
    end
  end
end
