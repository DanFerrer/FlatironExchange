class AddTitleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :title, :boolean
  end
end
