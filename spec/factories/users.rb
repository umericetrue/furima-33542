FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@examle' }
    password { 'aaa111'}
    password_confirmation {password}
    last_name { 'てすと' }
    first_name { 'てすと' }
    last_name_kana { 'テスト' }
    first_name_kana { 'テスト' }
    birth_date { '2000-01-01' }
  end
end
