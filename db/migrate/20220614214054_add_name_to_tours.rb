class AddNameToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :name, :string
  end
end
