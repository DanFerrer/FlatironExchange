class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true, dependent: :destroy
end
