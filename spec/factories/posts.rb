FactoryBot.define do
  factory :post do
    text           {Faker::String.random(length: 60)}
    title          {Faker::String.random(length: 20)}
    author         {Faker::String.random(length: 12)}
    introduction   {Faker::String.random(length: 130)}
    image          { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/neko.jpg')) }
    association    :user
  end
end