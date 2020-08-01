FactoryBot.define do

  factory :user do
    nickname {"あい"}
    email {"aaa@bbb"}
    password {"ht0000"}
    password_confirmation {"ht0000"}
    family_name {"一"}
    first_name  {"二"}
    family_name_kana{"イチ"}
    first_name_kana{"ニ"}
    birthday {"20000307"}
  end
end