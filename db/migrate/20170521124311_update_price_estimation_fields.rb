class UpdatePriceEstimationFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :price_estimations, :phone_number, :string
    remove_column :price_estimations, :communication_method, :string
    add_column :price_estimations, :phone_number_or_email, :string
  end
end
