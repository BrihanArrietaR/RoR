class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.integer :state
      t.belongs_to :user

      t.timestamps
    end
  end
end
