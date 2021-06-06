3.times do |n|
  publisher = Publisher.where(name: "著者#{n}").first_or_create
  publisher.books.destroy_all

  5.times do |n|
    book = Book.create(name: "本のタイトル#{n}巻", publisher: publisher, publisher_flag: true)
    Category.create(name: "カテゴリー#{n}", book: book)
  end
  book = Book.where(name: '個人出版の本のタイトル').first_or_create
  Category.where(name: '個人出版', book: book).first_or_create
end
