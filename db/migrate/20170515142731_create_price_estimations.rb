class CreatePriceEstimations < ActiveRecord::Migration[5.1]
  def change
    create_table :price_estimations do |t|
      t.string :platforms, array: true
      t.string :registration_methods, array: true
      t.boolean :camera_use
      t.boolean :geolocation_use
      t.string :notification_methods, array: true
      t.string :specification_stage
      t.boolean :logo
      t.string :communication_method
      t.string :name, null: false
      t.string :phone_number, null: false
      t.text :comment

      t.timestamps
    end
  end
end
