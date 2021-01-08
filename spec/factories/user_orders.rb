FactoryBot.define do
  factory :user_order do
    postal_code { '000-0000' }
    prefecture_id { 1 }
    city { 'テスト' }
    address { 'テスト' }
    building { 'テスト' }
    phone_number { '00000000000' }
    token { 'tok_ abcdefghijkel00000' }
    user_id { 1 }
    item_id { 1 }
  end
end
