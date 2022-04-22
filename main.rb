require './app'

def main
  app = App.new
  app.start_console
end

def list_of_options
  puts
  puts 'Choose any option by entering a number: '
  puts '[1] List of books'
  puts '[2] List of people'
  puts '[3] Create a person'
  puts '[4] Create a book'
  puts '[5] Create a rental'
  puts '[6] List all rentals for a given person id'
  puts '[7] Exit'
end

def option(input)
  case input
  when '1'
    list_of_books
  when '2'
    list_of_persons
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    list_of_rentals
  else
    puts 'Please enter a number from 1 and 7.'
  end
end

main
