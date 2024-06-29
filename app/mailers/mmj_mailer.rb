class MmjMailer < ApplicationMailer
  def send_when_admin_reply(user, mmj)
    @user = user
    @answer = mmj.reply_text
    mail to: user.email, subject: '【モモジャンFCより】お問い合わせありがとうございます。'
  end
end
