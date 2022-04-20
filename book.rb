class Book
  attr_reader :rental
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(person, date)
    @rental.push(Rental.new(date, person, self)) unless @rental.include?(Rental.new(date, person, self))
  end
end
