class AddDateToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :start_date, :Date
    add_column :tours, :end_date, :Date
  end
end
