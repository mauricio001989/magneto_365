FactoryBot.define do
  factory :reservation do
    user { create(:user) }
    film { create(:film) }
  end
end
