class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code
      t.integer     :first_address_id    , null: false
      t.string      :second_address      , null: false
      t.string      :third_address       , null: false
      t.string      :fourth_address
      t.string      :telephone           , null: false
      t.references  :purchase            , null: false

      t.timestamps
    end
  end
end
