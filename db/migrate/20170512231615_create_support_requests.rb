class CreateSupportRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :support_requests do |t|
      t.string :name
      t.string :email, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
