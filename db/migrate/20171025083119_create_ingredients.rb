class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.decimal :quantity, precision: 10, :scale => 5
      t.integer :servings
      t.integer :receipe_id
      t.boolean :bought
      t.references :receipe, foreign_key: true
    end
  end
end
