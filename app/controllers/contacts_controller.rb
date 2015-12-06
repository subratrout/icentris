class ContactsController < ApplicationController
  before_action :set_user
  def index
    @contacts = @user.contacts
  end

  def new
    @contact = @user.contacts.new
  end

  def create
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

  def set_user
    @user = User.find(params[:user_id])
  end
end
