class AddContactNoToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :contact_no, :string
  end
end
