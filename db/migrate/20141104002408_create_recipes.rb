class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text   :description, null: false
      t.text   :instructions, null: false

      t.timestamps
    end
  end
end
