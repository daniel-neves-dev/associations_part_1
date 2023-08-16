# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Function to perform Fisher-Yates shuffle
def fisher_yates_shuffle(arr)
  n = arr.length
  (n - 1).downto(1) do |i|
    j = rand(i + 1)
    arr[i], arr[j] = arr[j], arr[i]
  end
end

# Load all the sample image filenames into separate arrays for authors and books
author_sample_images = Dir.glob(Rails.root.join('public', 'author_images', '*.jpg')).map { |f| File.basename(f) }
book_sample_images = Dir.glob(Rails.root.join('public', 'book_images', '*.jpg')).map { |f| File.basename(f) }

# Shuffle the image filenames randomly for authors and books
fisher_yates_shuffle(author_sample_images)
fisher_yates_shuffle(book_sample_images)

# Seed 5 authors
5.times do
  author = Author.create!(
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number
  )

  # Get the next shuffled image filename for the author
  author_image_filename = author_sample_images.pop

  # Attach the sample image to the author
  author_image_path = Rails.root.join('public', 'author_images', author_image_filename)
  author.avatar.attach(io: File.open(author_image_path), filename: author_image_filename)

  # Seed 2 books for each author
  2.times do
    book = author.books.create!(
      title: Faker::Book.title,
      publish_at: Faker::Date.between(from: 10.years.ago, to: Date.today),
      description: Faker::Lorem.paragraph
    )

    # Get the next shuffled image filename for the book
    book_image_filename = book_sample_images.pop

    # Attach the sample image to the book
    book_image_path = Rails.root.join('public', 'book_images', book_image_filename)
    book.image.attach(io: File.open(book_image_path), filename: book_image_filename)
  end
end
