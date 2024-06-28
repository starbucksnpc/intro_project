class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.integer :year
      t.string :title
      t.integer :pages

      t.timestamps
    end
  end
end
