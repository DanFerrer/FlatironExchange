class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
    	t.text :content
    	t.integer :answer_id, index: true

    	t.timestamps null: false
    end
  end
end
