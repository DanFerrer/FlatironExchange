class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "user"
  belongs_to :responder, class_name: "user"
end
