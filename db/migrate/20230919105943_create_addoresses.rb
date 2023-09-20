class CreateAddoresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :postcode, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :name, null: false, default: ""
      t.timestamps
    end
  end
end
