require 'rails_helper'

describe "Creating a new contact" do
  it "saves the contact" do
    user = User.create(user_attributes)

    visit user_url(user)

    click_link 'Add Contact'

    expect(current_path).to eq(new_user_contact_path(user))

    fill_in "Name", with: "Ryan Fox"
    fill_in "Email", with: "ryan@icentris.com"
    fill_in "Phone", with: "234-567-8901"
    fill_in "Address", with: "707 wood cross, Utah"

    click_button 'Create Contact'

    expect(current_path).to eq(user_contacts_path(user))

    expect(page).to have_text("Contact added!")
  end

  it "does not save the contact if it's invalid" do
    user = User.create(user_attributes)

    visit new_user_contact_url(user)

    expect {
      click_button 'Add Contact'
    }.not_to change(contact, :count)

    expect(page).to have_text('error')
  end
end
