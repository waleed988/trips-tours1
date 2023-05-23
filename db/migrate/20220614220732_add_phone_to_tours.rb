class AddPhoneToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :phone, :string
  end
end
