FactoryBot.define do
  factory :post do
    title { 'Test Post' }
    sequence(:text) { |n| "Test post content #{n}" }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
