class User001Mailer < ApplicationMailer
  #layout 'user'

  def user_create_mail(user)
    attachments.inline['welcome.webp'] = File.read('app/assets/images/welcome.webp')
    @user=user
    puts @user
    mail(to: email_address_with_name(@user.email, @user.name),subject: 'Welcome to our website') do |format|
      format.html { render layout: "user_create" }
      format.text
    end
  end

  def update_email_mail(user)
    @user=user
    puts @user
    mail(to: email_address_with_name(@user.email, @user.name),subject: 'Successfully Updated your email id') do |format|
      format.html { render layout: "update_email" }
      format.text
    end
  end

end
