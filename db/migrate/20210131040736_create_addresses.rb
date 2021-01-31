class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :purchase_id,    null: false, foreign_key: true
      t.string  :zip,            null: false
      t.integer :prefecture_id,  null: false
      t.string  :city,           null: false
      t.string  :number,         null: false
      t.string  :building       
      t.string  :tel,            null: false
      t.timestamps
    end
  end
end
