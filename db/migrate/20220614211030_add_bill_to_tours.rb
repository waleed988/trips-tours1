class AddBillToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :bill, :integer
  end
end
