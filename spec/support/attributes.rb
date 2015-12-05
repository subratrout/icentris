def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    password: "secret",
    password_confirmation: "secret"
  }.merge(overrides)
end

def contact_attributes(overrides = {})
  {
    name: "Roger Ebert",
    email: "user@example.com",
    phone: "123-456-6789",
    address: "123, shoreline dr, utah"
  }.merge(overrides)
end
