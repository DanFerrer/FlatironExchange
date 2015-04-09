class DropRepliesTable < ActiveRecord::Migration
  def change
  	drop_table :replies
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
