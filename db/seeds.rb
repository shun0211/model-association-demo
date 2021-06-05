3.times do |n|
  publisher = Publisher.where(name: "著者#{n}").first_or_create
  publisher.books.destroy_all

  5.times do |n|
    book = Book.create(name: "本のタイトル#{n}巻", publisher: publisher)
    Category.create(name: "カテゴリー#{n}", book: book)
  end
end
