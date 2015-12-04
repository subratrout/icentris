require 'rails_helper'

describe "Viewing the list of users" do

  it "shows the users" do
    user1 = User.create!(user_attributes(name: "Subrat", email: "subrat@example.com"))
    user2 = User.create!(user_attributes(name: "Ryan",   email: "ryan@icentris.com"))
    user3 = User.create!(user_attributes(name: "Chris", email: "chris@icentris.com"))

    visit users_url

    expect(page).to have_text(user1.name)
    expect(page).to have_text(user2.name)
    expect(page).to have_text(user3.name)
  end

end
