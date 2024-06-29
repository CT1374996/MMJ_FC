class Admin::MmjsController < ApplicationController
  def update
    mmj = Mmj.find(params[:id])
    mmj.update(mmj_params)
    user = mmj.user
    MmjMailer.send_when_admin_reply(user, mmj).deliver
  end
end
