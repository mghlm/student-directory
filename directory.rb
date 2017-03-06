@students = [] #accesible to all methods.

#Asks user to input details about student such as name and cohort. Saves inputs as hashes in @students array.
def input_students
  puts "Please enter the following info about the students. To finish, hit return twice.\n"

  valid_months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

  puts "Name:"
  name = STDIN.gets.chomp

  while !name.empty? do

    puts "Country:"
    country = STDIN.gets.chomp
      break if country.empty?

    puts "Hobby:"
    hobby = STDIN.gets.chomp
      break if hobby.empty?

    puts "Height:"
    height = STDIN.gets.chomp
      break if height.empty?

    puts "Cohort:"
    cohort = STDIN.gets.chomp.downcase.to_sym
      break if cohort.empty?
        while !valid_months.include?(cohort)
          puts "Please enter a calendar month"
          cohort = STDIN.gets.delete("\n").downcase.to_sym
        end

    add_students_to_list(name, country, hobby, height, cohort)
    puts "#{name} was succesfully added to the #{cohort.capitalize} cohort."

    if @students.count > 1
      puts "Now we have #{@students.count} students\n"
    else
      puts "Now we have #{@students.count} student\n"
    end

    puts "Name:"
    name = STDIN.gets.chomp
      break if name.empty?
  end

  @students
end

#Prints header only if there are students to list.
def print_header
  if @students.count > 0
    puts "The students of Villains Academy:\n"
    puts "------------\n"
  end
end

#Prints list of students sorted by cohort.
def print_student_list
  if @students.length > 0
    cohorts = @students.map do |student| student[:cohort] end
      cohorts.uniq.each do |x|
        puts "#{x.capitalize} cohort:"
        @students.each do |student|
        if student[:cohort] == x
          puts "- Name: #{student[:name]}, Country of Origin: #{student[:country]}, Hobby: #{student[:hobby]}, Height: #{student[:height]}"
        end
      end
    end
  else
    puts "There are no students enrolled at the moment."
  end
end

#Prints the footer that counts the number of students.
def print_footer
  if @students.length > 0
    puts "Overall, we have #{@students.count} students."
  end
end

#Prints options for user inputs.
def print_menu
  puts "What would you like to do?\n"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

#Prints header, list of students and footer
def show_students
  print_header
  print_student_list
  print_footer
end

#Runs method depending on user input which is taken as an argument.
def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

#Keeps printing the menu and runs the process method based on user input (taken as argument)
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

#Saves list of student to seperate file.
def save_students
  puts "Which file would you like to save changes to?"
  filename = STDIN.gets.chomp
  if File.exist?(filename)
    file = File.open("filename", "w")
    @students.each do |student|
      student_data = [student[:name], student[:country], student[:hobby], student[:height], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    puts "The changes have been saved.\n"
    file.close
  else
    puts "Sorry, that file doesn't seem to exist."
  end
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
    name, country, hobby, height, cohort = line.chomp.split(',')
      add_students_to_list(name, country, hobby, height, cohort)
    end
    file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students()
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def add_students_to_list(name, country, hobby, height, cohort)
  @students << {name: name, country: country, hobby: hobby, height: height, cohort: cohort.to_sym}

end

try_load_students
interactive_menu
