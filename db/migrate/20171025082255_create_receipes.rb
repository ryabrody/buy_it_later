class CreateReceipes < ActiveRecord::Migration[5.1]
  def change
    create_table :receipes do |t|
      t.string :url
      t.string :image
      t.string :name
    end
  end
end
