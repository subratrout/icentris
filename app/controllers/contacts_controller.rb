class ContactsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @contacts = @user.contacts
  end

  def new
    @user = User.find(params[:user_id])
    @contact = @user.contacts.new
  end

  def create
    @user = User.find(params[:user_id])
    @contact = @user.contacts.new(contact_params)
    if @contact.save
      redirect_to user_contacts_path(@user),
            notice: "Contacts added"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address)
  end
end
