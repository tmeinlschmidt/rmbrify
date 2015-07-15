Fabricator(:user) do
  email                  { |i| "user_#{i[:login]}@somewhere.com" }
  password               "password"
  password_confirmation  "password"
  language               "cz"
end

Fabricator(:admin, from: :user) do
  email                  { |i| "admin_#{i[:login]}@somewhere.com" }
end
