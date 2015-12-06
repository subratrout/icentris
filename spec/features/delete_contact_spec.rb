require 'rails_helper'

describe "Deleting a contact" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "destroys the contact and shows the contact listing without the deleted contact" do
    contact = contact.create!(contact_attributes)

    visit contact_path(contact)

    click_link 'Delete'

    expect(current_path).to eq(contacts_path)
    expect(page).not_to have_text(contact.title)
    expect(page).to have_text("contact successfully deleted!")
  end
end
