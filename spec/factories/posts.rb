FactoryBot.define do
  factory :post do
    title { 'Test Post' }
    text { 'Test post content.' }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
