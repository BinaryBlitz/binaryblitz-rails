class CreateCallbackRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :callback_requests do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :phone_number, null: false
      t.text :content

      t.timestamps
    end
  end
end
