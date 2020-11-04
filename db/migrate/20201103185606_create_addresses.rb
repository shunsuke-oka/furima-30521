class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :post_num,      null: false
      t.integer :area_id,       null: false
      t.string  :city_name,     null: false
      t.string  :city_num,      null: false
      t.string  :building_name, null: false
      t.string  :phone_num,     null: false
      t.references :buy_history,       null: false,  foreign_key: true
      t.timestamps
    end
  end
end
