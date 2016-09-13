class MessagesController < ApplicationController

  before_action :authenticate_user!

  def new
    @user = User.find_by(id: params[:recipient_id])
    @classified = Classified.find_by(id: params[:classified_id])
  end


  def name 
    first_name
  end



  def mailboxer_email(object)
    email
  end



  def create
    classifieds = Classified.find_by(id: params[:classified_id])
    recipients = User.find_by(id: params[:recipient_id])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end



end