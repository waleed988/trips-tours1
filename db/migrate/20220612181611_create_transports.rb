class CreateTransports < ActiveRecord::Migration[6.0]
  def change
    create_table :transports do |t|
      t.string :registration_no
      t.string :category
      t.string :price

      t.timestamps
    end
  end
end
