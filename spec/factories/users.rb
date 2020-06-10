FactoryBot.define do

  factory :user do
    name                  {"ネコちゃん"}
    email                 {"nekochan@gmail.com"}
    password              {"123456"}
    password_confirmation {"123456"}
  end

end