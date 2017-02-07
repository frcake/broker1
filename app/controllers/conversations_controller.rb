class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index, :empty_trash]
  before_action :get_box, only: [:index]

  def index
    @conversations = if @box.eql? 'inbox'
                       @mailbox.inbox
                     elsif @box.eql? 'sent'
                       @mailbox.sentbox
                     else
                       @mailbox.trash
                     end

    @conversations = @conversations.paginate(page: params[:page], per_page: 10)
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  def destroy
    @conversation.move_to_trash(current_user)
    flash[:success] = 'The conversation was moved to trash.'
    respond_to do |format|
      format.js
    end
  end

  def restore
    @conversation.untrash(current_user)
    flash[:success] = 'The conversation was restored.'
    redirect_to conversations_path
  end

  def empty_trash
    @mailbox.trash.each do |conversation|
      conversation.receipts_for(current_user).update_all(deleted: true)
    end
    flash[:success] = 'Your trash was cleaned!'
    redirect_to conversations_path
  end

  def mark_as_read
    @conversation.mark_as_read(current_user)
    flash[:success] = 'The conversation was marked as read.'
    redirect_to conversations_path
  end

  private

  def get_box
    if params[:box].blank? || !%w(inbox sent trash).include?(params[:box])
      params[:box] = 'inbox'
    end
    @box = params[:box]
  end

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def show; end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end

#   before_filter :authenticate_user!
#   helper_method :mailbox, :conversation
#
#   def create
#     recipient_emails = conversation_params(:recipients).split(',')
#     recipients = User.where(email: recipient_emails).all
#
#     conversation = current_user.
#       send_message(recipients, *conversation_params(:body, :subject)).conversation
#
#     redirect_to conversation_path(conversation)
#   end
#
#   def reply
#     current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
#     redirect_to conversation_path(conversation)
#   end
#
#   def trash
#     conversation.move_to_trash(current_user)
#     redirect_to :conversations
#   end
#
#   def untrash
#     conversation.untrash(current_user)
#     redirect_to :conversations
#   end
#
#   private
#
#   def mailbox
#     @mailbox ||= current_user.mailbox
#   end
#
#   def conversation
#     @conversation ||= mailbox.conversations.find(params[:id])
#   end
#
#   def conversation_params(*keys)
#     fetch_params(:conversation, *keys)
#   end
#
#   def message_params(*keys)
#     fetch_params(:message, *keys)
#   end
#
#   def fetch_params(key, *subkeys)
#     params[key].instance_eval do
#       case subkeys.size
#       when 0 then self
#       when 1 then self[subkeys.first]
#       else subkeys.map{|k| self[k] }
#       end
#     end
#   end
# end
#
#
#   before_filter :authenticate_user!
#   before_filter :get_mailbox, :get_box, :get_actor
#   before_filter :check_current_subject_in_conversation, :only => [:show, :update, :destroy]
#
#   def index
#     if @box.eql? "inbox"
#       @conversations = @mailbox.inbox.page(params[:page]).per(9)
#     elsif @box.eql? "sentbox"
#       @conversations = @mailbox.sentbox.page(params[:page]).per(9)
#     else
#       @conversations = @mailbox.trash.page(params[:page]).per(9)
#     end
#
#     respond_to do |format|
#       format.html { render @conversations if request.xhr? }
#     end
#   end
#
#   def show
#     if @box.eql? 'trash'
#       @receipts = @mailbox.receipts_for(@conversation).trash
#     else
#       @receipts = @mailbox.receipts_for(@conversation).not_trash
#     end
#     render :action => :show
#     @receipts.mark_as_read
#   end
#
#   def update
#     if params[:untrash].present?
#     @conversation.untrash(@actor)
#     end
#
#     if params[:reply_all].present?
#       last_receipt = @mailbox.receipts_for(@conversation).last
#       @receipt = @actor.reply_to_all(last_receipt, params[:body])
#     end
#
#     if @box.eql? 'trash'
#       @receipts = @mailbox.receipts_for(@conversation).trash
#     else
#       @receipts = @mailbox.receipts_for(@conversation).not_trash
#     end
#     redirect_to :action => :show
#     @receipts.mark_as_read
#
#   end
#
#   def destroy
#
#     @conversation.move_to_trash(@actor)
#
#     respond_to do |format|
#       format.html {
#         if params[:location].present? and params[:location] == 'conversation'
#           redirect_to conversations_path(:box => :trash)
#   else
#           redirect_to conversations_path(:box => @box,:page => params[:page])
#   end
#       }
#       format.js {
#         if params[:location].present? and params[:location] == 'conversation'
#           render :js => "window.location = '#{conversations_path(:box => @box,:page => params[:page])}';"
#   else
#           render 'conversations/destroy'
#   end
#       }
#     end
#   end
#
#   private
#
#   def get_mailbox
#     @mailbox = current_actor.mailbox
#   end
#
#   def get_actor
#     @actor = Actor.normalize(current_subject)
#   end
#
#   def get_box
#     if params[:box].blank? or !["inbox","sentbox","trash"].include?params[:box]
#       params[:box] = 'inbox'
#     end
#
#     @box = params[:box]
#   end
#
#   def check_current_subject_in_conversation
#     @conversation = Conversation.find_by_id(params[:id])
#
#     if @conversation.nil? or !@conversation.is_participant?(@actor)
#       redirect_to conversations_path(:box => @box)
#     return
#     end
#   end
#
# end
