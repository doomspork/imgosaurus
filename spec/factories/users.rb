# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'passwords are great'
    password_confirmation 'passwords are great'
  end

  factory :admin, class: User do
    admin true
    email 'user@example.com'
    password 'passwords are great'
    password_confirmation 'passwords are great'
  end
end
