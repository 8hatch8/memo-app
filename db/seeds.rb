5.times do
  Memo.create(
    title:    Faker::Lorem.word,
    content:  Faker::Lorem.sentence,
  )
end
