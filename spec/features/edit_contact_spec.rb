require 'rails_helper'

describe "Editing a contact" do

  it "updates the contact and shows the contact's updated details" do
    contact = Contact.create(contact_attributes)

    visit edit_user_contact_url(contact)

    click_link 'Edit'

    expect(current_path).to eq(edit_user_contact_path(contact))

    expect(find_field('Name').value).to eq(contact.name)

    fill_in 'Name', with: "Updated contact Name"

    click_button 'Update contact'

    expect(current_path).to eq(user_path(user))

    expect(page).to have_text('Updated contact Title')
    expect(page).to have_text('Contact successfully updated!')
  end

  it "does not update the contact if it's invalid" do
    contact = Contact.create(contact_attributes)

    visit edit_contact_url(contact)

    fill_in 'Title', with: " "

    click_button 'Update contact'

    expect(page).to have_text('error')
  end
end
