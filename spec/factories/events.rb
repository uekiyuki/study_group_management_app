FactoryBot.define do
  factory :event do
    title { '勉強会１' }
    content { '英語の勉強をしよう！' }
    capacity { 5 }
    location { '東京のどこか' }
    price { 1000 }
    event_at { '2019-10-01' }
    user
  end

  # factory :event2, class: Event do
  #   title { '勉強会２' }
  #   content { 'rubyの勉強をしよう！' }
  #   capacity { 10 }
  #   association :user, factory: :admin_user
  # end
end
