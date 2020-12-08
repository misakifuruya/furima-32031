FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'a000000' }
    password_confirmation { password }
    last_name             { 'あ' }
    first_name            { 'い' }
    last_name_kana        { 'ア' }
    first_name_kana       { 'イ' }
    birthday              { '1990-01-01' }
  end
end
