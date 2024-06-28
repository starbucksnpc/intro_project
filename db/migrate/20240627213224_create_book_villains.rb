class CreateBookVillains < ActiveRecord::Migration[7.1]
  def change
    create_table :book_villains do |t|
      t.references :book, null: false, foreign_key: true
      t.references :villain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
