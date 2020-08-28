FactoryBot.define do
  factory :user do
    nickname { 'test' }
    family_name { '横山' }
    first_name { '友希' }
    family_name_kana { 'ヨコヤマ' }
    first_name_kana { 'ユウキ' }
    birthday { '2000/1/1/' }
    email { 'test@test' }
    password { 'yuuki0903' }
  end
end
