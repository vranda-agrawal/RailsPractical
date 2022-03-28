class User001 < ApplicationRecord
  mount_uploader :picture, PictureUploader
  before_update :send_email 
end

def send_email
  if email_changed?
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "email chnaged"
    puts self.email
    User001Mailer.update_email_mail(self).deliver_later
  end
end