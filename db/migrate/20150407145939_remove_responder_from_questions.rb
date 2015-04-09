class RemoveResponderFromQuestions < ActiveRecord::Migration
  def change
    remove_reference :questions, :responder, index: true
    remove_foreign_key :questions, :responders
  end
end
