class AddUrlPathToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :url_path, :string
  end
end
