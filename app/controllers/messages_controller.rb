class MessagesController < ApplicationController
	def create
		current_contact.reply_to_conversation( Mailboxer::Conversation.find(params[:conversation_id]), params[:body])
		redirect_to request.referer
	end
end
