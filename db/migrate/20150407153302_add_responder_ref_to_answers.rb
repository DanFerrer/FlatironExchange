class AddResponderRefToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :responder, index: true
    add_foreign_key :answers, :responders
  end
end
