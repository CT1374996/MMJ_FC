class MmjMailer < ApplicationMailer
  default from: "notifications@example.com"
  #defaultはメーラーから送信するあらゆるメールで使われるデフォルト値のハッシュ

  def welcome_email
    @user = params[:user]
    @url = "http://mmj.com/login"
    mail(to: @user.email, subject: "会員登録ありがとうございます")
  end

  def send_when_admin_reply(user, mmj)
    @user = user
    @answer = mmj.reply_text
    mail to: user.email, subject: '【モモジャンFCより】お問い合わせありがとうございます。'
  end
end
