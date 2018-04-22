class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def show
		@contact = Contact.find params[:id]
	end

	def edit
		@contact = Contact.find params[:id]
	end

  def update
  	@contact = Contact.find params[:id]
		@contact.update params[:contact].permit!
	end

	def create
		Contact.create params[:contact].permit!
	end

	def index
	  @contacts = Contact.all
	end
end
