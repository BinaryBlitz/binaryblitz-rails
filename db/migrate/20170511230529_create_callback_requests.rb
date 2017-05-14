class CreateCallbackRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :callback_requests do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone_number
      t.text :content

      t.timestamps
    end
  end
end
