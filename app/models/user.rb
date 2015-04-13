class User < ActiveRecord::Base
  has_many :questions, foreign_key: "asker_id"
  has_many :answers, foreign_key: "responder_id"
  has_many :activities, dependent: :destroy
  after_create :sign_up_notification
  acts_as_voter

  def self.create_with_omniauth(auth)
    new do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.image_url = auth["info"]["image"]
    end
  end

  private
  def sign_up_notification
    UserMailer.sign_up(self).deliver
  end

  def self.titles
    ["Instructor", "Alum", "Student"]
  end
end
