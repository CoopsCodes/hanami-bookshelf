# Seed classic books
books = Hanami.app["relations.books"]

classic_books = [
  { title: "Pride and Prejudice", author: "Jane Austen" },
  { title: "To Kill a Mockingbird", author: "Harper Lee" },
  { title: "1984", author: "George Orwell" },
  { title: "The Great Gatsby", author: "F. Scott Fitzgerald" },
  { title: "Jane Eyre", author: "Charlotte Brontë" },
  { title: "The Catcher in the Rye", author: "J.D. Salinger" },
  { title: "Wuthering Heights", author: "Emily Brontë" },
  { title: "The Lord of the Rings", author: "J.R.R. Tolkien" },
  { title: "Crime and Punishment", author: "Fyodor Dostoevsky" },
  { title: "The Adventures of Huckleberry Finn", author: "Mark Twain" },
  { title: "Brave New World", author: "Aldous Huxley" },
  { title: "The Picture of Dorian Gray", author: "Oscar Wilde" },
  { title: "Moby Dick", author: "Herman Melville" },
  { title: "The Count of Monte Cristo", author: "Alexandre Dumas" },
  { title: "Anna Karenina", author: "Leo Tolstoy" },
  { title: "The Brothers Karamazov", author: "Fyodor Dostoevsky" },
  { title: "One Hundred Years of Solitude", author: "Gabriel García Márquez" },
  { title: "The Hobbit", author: "J.R.R. Tolkien" },
  { title: "Fahrenheit 451", author: "Ray Bradbury" },
  { title: "Dracula", author: "Bram Stoker" }
]

classic_books.each do |book_data|
  unless books.where(title: book_data[:title], author: book_data[:author]).exist?
    books.insert(book_data)
  end
end

puts "Seeded #{classic_books.length} classic books into the database."
