class CreateShortVillains < ActiveRecord::Migration[7.1]
  def change
    create_table :short_villains do |t|
      t.references :short, null: false, foreign_key: true
      t.references :villain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
