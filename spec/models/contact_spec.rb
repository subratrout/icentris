require 'rails_helper'

describe "A contact" do

  it "belongs to a user" do
    user = User.create(user_attributes)

    contact = user.contacts.new(contact_attributes)

    expect(contact.user).to eq(user)
  end

  it "with example attributes is valid" do
    contact = Contact.new(contact_attributes)

    expect(contact.valid?).to eq(true)
  end

  it "requires a name" do
    contact = Contact.new(name: "")

    contact.valid? # populates errors

    expect(contact.errors[:name].any?).to eq(true)
  end

  it "requires a email" do
    contact = Contact.new(email: "")

    contact.valid?

    expect(contact.errors[:email].any?).to eq(true)
  end

  it "requires a address" do
    contact = Contact.new(address: "")

    contact.valid?

    expect(contact.errors[:address].any?).to eq(true)
  end

  it "requires a phone number" do
    contact = Contact.new(phone: "123-456-6789")

    contact.valid?

    expect(contact.errors[:phone].any?).to eq(false)
  end

  it "rejects invalid phone number" do
    contact = Contact.new(phone: "12-34-3455")

    contact.valid?

    expect(contact.errors[:phone].any?).to eq(true)
    expect(contact.errors[:phone].first).to eq("must be XXX-XXX-XXXX format")
  end
end
