class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :unit
      t.string :street_number
      t.string :street_name
      t.string :suburb
      t.string :state
      t.string :post_code
      t.timestamps
    end
  end
end
