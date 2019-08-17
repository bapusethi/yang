# frozen_string_literal: true

class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.integer :gender
      t.integer :years
      t.integer :months
      t.string :description
      t.references :contact
      t.timestamps
    end
  end
end
