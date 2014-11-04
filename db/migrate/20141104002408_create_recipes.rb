class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, default: "My Recipe", null: false
      t.text   :description
      t.text   :instructions

      t.timestamps
    end
  end
end
