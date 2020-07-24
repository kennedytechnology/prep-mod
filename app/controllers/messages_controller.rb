class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  layout "clinic_management"

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to clinics_path, notice: "Your message request is sent. Review is on the way."
    else
      redirect_back fallback_location: root_path, alert: @clinic.errors.to_s
    end
  end

  private

  def message_params
    params.require(:message).permit(:subject, :body, :send_to_all_users)
  end

end
