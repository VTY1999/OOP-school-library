require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def start_console
    puts 'Welcome to School Library!'
    until list_of_options
      input = gets.chomp
      if input == '7'
        puts 'Thank You for using School Library!'
        break
      end

      option input
    end
  end

  def list_of_books
    puts 'Empty! Add book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_of_persons
    puts 'Empty! Add person.' if @persons.empty?
    @persons.each { |person| puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}" }
  end

  def create_person
    print 'To create a student, press 1, To create a teacher, press 2 : '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid. Try again'
    end
  end

  def create_student
    puts 'Create new student'
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new('classroom', age, name, parent_permission: false)
      @persons << student
      puts 'Student doesnt have parent permission, cant rent books'
    when 'y'
      student = Student.new('classroom', age, name, parent_permission: true)
      @persons << student
      puts 'Student created successfully'
    end
  end

  def create_teacher
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @persons << teacher
    puts 'Teacher created successfully'
  end

  def create_book()
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{title} created successfully."
  end

  def create_rental
    puts 'Select which book you want to rent by entering its number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @books[book_id], @persons[person_id])
    @rentals << rental

    puts 'Rental created successfully'
  end

  def list_of_rentals
    print 'To see rentals enter the person ID: '
    id = gets.chomp.to_i

    puts 'Rented Books:'
    @rentals.each do |rental|
    if rental.person.id == id
      puts 'Empty! Add a ID.' if @rentals.empty?
      @rentals.each { |rental| puts "Peson: #{rental.person.name}  Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" }
     end
   end
  end 
end
