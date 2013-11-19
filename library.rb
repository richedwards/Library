# Library class

class Library
  def initialize
    @books = []
  end


  # def books 

  # end

  def list_books
    @books.each do |b|
      puts "Book, #{b.title} is #{b.status}"
    end
  end


   def borrowed_books
    @books.each do |book|
      if book.status == "unavailable"
        puts "#{book.title} is checked out by #{book.borrowed_by.name}."
      end
    end
  end


  def available_books
    puts "These are the available books:"
      @books.each do |book|
        if book.status == "available"
        puts "#{book.title}"
        end
      end
    end

   def add_book(book)
          @books << book
          puts "#{book.title} was added."
      end


    def check_out(user, book)
      if user.borrowed_count <2 && book.status == "available"
        user.borrowed_count += 1
        user.borrowed_books << book
        book.status = "unavailable"
        book.borrowed_by = user
        puts "#{book.title} was checked out by #{user.name}."
      elsif user.borrowed_count =2
        puts "Sorry #{user.name} already has 2 books checked out."
      elsif book.status != "available"
        puts "Sorry #{book.title} is currently checked out"
      end
    end
      

    def check_in(user, book)
          user.borrowed_count -= 1
          user.borrowed_books.delete(book)
          book.status = "available"
          book.borrowed_by = nil
          puts "#{book.title} was checked IN by #{user.name}."
      end
    end


 # Borrower Class
  
  
  class Borrower
  attr_reader :name, :rating, :review
  attr_accessor :borrowed_count, :borrowed_books
  
  def initialize(name)
    @name = name
    @borrowed_count = 0
    @borrowed_books = []
  end

  def rate(book, rating, review = nil)
    @rating = rating
    @review = review
    book.rating_hash = {self.name => [rating, review] }
    puts book.rating_hash
  end

  def borrowed_books_count
      puts "#{name} has checked out #{borrowed_count} book(s)."
  end

  def borrowed_books_list
    puts "#{name} has checked out the following books" 
    borrowed_books.each do |book|
      puts "#{book.title}"
    end
  end
end
  
  
  
  # This is the BOOK CLASS

class Book

  attr_reader :title, :author, :year_published, :edition
  attr_accessor :status, :borrowed_by, :rating_hash

  def initialize(title, author, year_published = nil, edition = nil)
    @title = title
    @author = author
    @year_published = year_published
    @edition = edition
    @status = "available"
    @borrowed_by = nil
    @rating_hash = {}
  end

  def see_ratings 
    puts "The ratings for #{self.title} are:" 
    puts rating_hash

    puts "There is #{rating_hash.length} rating(s) for #{self.title}."

    rating_hash.each { |key, value| 
      puts "#{key} gave a rating of #{value[0]}."
      if value[1]
        puts "#{key} said #{value[1]}."
      end
    }
  end

end