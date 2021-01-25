FactoryBot.define do
  factory :post, class: Post do
    sequence(:title) { |n| (Random.new(n).rand(8999999) + 1000000).to_s }
    sequence(:body) { |n| (Random.new(n).rand(8999999) + 1000000).to_s }
  end
end
