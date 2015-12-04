def user_attributes(overrides = {})
  {
    name: "Subrat Rout",
    email: "subrat@rout.com",
    password: "password",
    password_confirmation: "password"
  }.merge(overrides)
end
