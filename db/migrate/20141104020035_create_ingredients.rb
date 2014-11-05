class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string  :label, null: false

      t.timestamps
    end
  end
end
