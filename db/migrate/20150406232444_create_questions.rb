class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.references :asker, index: true
      t.references :responder, index: true

      t.timestamps null: false
    end
    add_foreign_key :questions, :askers
    add_foreign_key :questions, :responders
  end
end
