FactoryBot.define do
  factory :named_place do
    name { Faker::JapaneseMedia::OnePiece.unique.island }
  end
end
