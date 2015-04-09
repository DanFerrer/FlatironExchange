class ChangeTitleToString < ActiveRecord::Migration
  def up
  	change_column :users, :title, :string
  end

  def down
  	change_column :users, :title, :boolean
  end
end
