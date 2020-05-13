class Message < ApplicationRecord
  after_create :send_email, if: lambda { status == "approved" }
  after_update :send_email, if: lambda { status == "approved" }

  validates_presence_of :subject, :body

  before_create do
    self.status = "pending"
  end

  def send_email
    case  
    when send_to_all_users == true
      User.all.map{ |u| MessageMailer.message_approved(u.email, self).deliver }
    else
      "Default behaviour"
    end
  end
end
