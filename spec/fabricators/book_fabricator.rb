
Fabricator(:book) do

  title { Faker::Lorem.sentence }

  price { Faker::Commerce.price }

  isbn { Faker::Code.isbn }

  page_count { Faker::Number.number(4) }

  description { Faker::Lorem.paragraph }

  published_at 1.year.ago

  publisher
end
