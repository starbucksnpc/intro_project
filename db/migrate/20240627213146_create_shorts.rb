class CreateShorts < ActiveRecord::Migration[7.1]
  def change
    create_table :shorts do |t|
      t.string :title
      t.string :type
      t.string :handle
      t.integer :year

      t.timestamps
    end
  end
end
