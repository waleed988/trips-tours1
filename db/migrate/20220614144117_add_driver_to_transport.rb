class AddDriverToTransport < ActiveRecord::Migration[6.0]
  def change
    add_column :transports, :driver_name, :string
    add_column :transports, :driver_cnic, :string
    add_column :transports, :driver_phone, :integer
  end
end
