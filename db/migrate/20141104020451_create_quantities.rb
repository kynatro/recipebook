class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.integer :ingredient_id, null: false
      t.integer :recipe_id, null: false
      t.string  :amount

      t.timestamps
    end
  end
end
