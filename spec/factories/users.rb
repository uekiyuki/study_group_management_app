FactoryBot.define do
  factory :user do
    name { 'テストユーザー1' }
    email { 'test1@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end

  # factory :admin_user, class: User do
  #   name { 'テストアドミンユーザー1' }
  #   email { 'test1_admin@example.com' }
  #   password { 'password' }
  #   admin { true }
  # end
end
