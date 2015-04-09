class User < ActiveRecord::Base
  has_many :questions, foreign_key: "asker_id"
  has_many :answers, foreign_key: "responder_id"
  after_create :sign_up_notification
  acts_as_voter

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.image_url = auth["info"]["image"]
    end
  end


  def sign_up_notification
    UserMailer.sign_up(self).deliver
  end
end
