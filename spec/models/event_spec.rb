require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    name = 'test user'
    email = 'tabuchi@dic.com'
    password = 'tabuchi'
    password_confirmation = 'tabuchi'
    User.create!(name: name, email: email, password: password, password_confirmation: password_confirmation)
  end

  it 'is valid with a title, content, event_at, location, price, capacity' do
    event = Event.new(title: 'test title',
                      content: 'test content',
                      location: 'somewhere in Tokyo',
                      price: 1_000,
                      event_at: '2019-10-01',
                      capacity: 5,
                      user_id: User.find_by(email: 'tabuchi@dic.com').id)
    expect(event).to be_valid
  end

  it 'is invalid without a title' do
    event = Event.new(title: nil)
    event.valid?
    expect(event.errors[:title]).to include('を入力してください')
  end

  it 'is invalid with a title is 33 or more characters' do
    event = Event.new(title: 'a' * 33)
    event.valid?
    expect(event.errors[:title]).to include('は32文字以内で入力してください')
  end

  it 'is invalid without a location' do
    event = Event.new(location: nil)
    event.valid?
    expect(event.errors[:location]).to include('を入力してください')
  end

  it 'is invalid with a location is 33 or more characters' do
    event = Event.new(location: 'a' * 33)
    event.valid?
    expect(event.errors[:location]).to include('は32文字以内で入力してください')
  end

  it 'is invalid without a price' do
    event = Event.new(price: nil)
    event.valid?
    expect(event.errors[:price]).to include('を入力してください')
  end

  it 'is invalid if a price is not integer' do
    event = Event.new(price: 'a')
    event.valid?
    expect(event.errors[:price]).to include('は数値で入力してください')
  end

  it 'is invalid if a price is minus figure' do
    event = Event.new(price: -1)
    event.valid?
    expect(event.errors[:price]).to include('は0より大きい値にしてください')
  end

  it 'is invalid without a event_at' do
    event = Event.new(event_at: nil)
    event.valid?
    expect(event.errors[:event_at]).to include('を入力してください')
  end

  it 'is invalid without a event_at' do
    event = Event.new(event_at: Date.today - 1)
    event.valid?
    expect(event.errors[:event_at]).to include('は過去の日付は使えません')
  end

  it 'is invalid without a capacity' do
    event = Event.new(capacity: nil)
    event.valid?
    expect(event.errors[:capacity]).to include('を入力してください')
  end

  it 'is invalid if a capacity is not integer' do
    event = Event.new(capacity: 'a')
    event.valid?
    expect(event.errors[:capacity]).to include('は数値で入力してください')
  end

  it 'is invalid if a capacity is minus figure' do
    event = Event.new(capacity: -1)
    event.valid?
    expect(event.errors[:capacity]).to include('は0より大きい値にしてください')
  end
end
