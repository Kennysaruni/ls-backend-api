class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :url
      t.string :slug
      t.string :clicked , default: 0

      t.timestamps
    end
  end
end
