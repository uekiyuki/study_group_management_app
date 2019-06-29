FactoryBot.define do
  factory :event do
    title { '勉強会１' }
    content { '英語の勉強をしよう！' }
    capacity { 5 }
    user
  end

  factory :event2, class: Event do
    title { '勉強会２' }
    content { 'rubyの勉強をしよう！' }
    capacity { 10 }
    association :user, factory: :admin_user
  end
end
