class RenameTypeColumnInShorts < ActiveRecord::Migration[7.1]
  def change
    rename_column :shorts, :type, :short_type
  end
end
