class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :price, null: false
      t.text :introduction, null: false
      t.string :name, null: false
      t.boolean :is_sale_status, null: false, default: true
      t.references :genre, foreign_key: true

      t.timestamps


    end
  end
end
