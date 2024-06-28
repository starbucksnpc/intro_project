class CreateVillains < ActiveRecord::Migration[7.1]
  def change
    create_table :villains do |t|
      t.string :name
      t.string :gender
      t.string :status

      t.timestamps
    end
  end
end
