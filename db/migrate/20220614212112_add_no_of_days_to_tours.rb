class AddNoOfDaysToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :no_of_days, :integer
  end
end
