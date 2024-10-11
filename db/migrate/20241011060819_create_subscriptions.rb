class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :customer, foreign_key: true
      t.references :tea, foreign_key: true
      t.string :sub_name
      t.float :price
      t.integer :status, default: 0
      t.integer :frequency, default: 0 

      t.timestamps
    end
  end
end
