def input_students
  puts "Please enter the name, country of origin, hobby and height of the students"
  puts "To finish, just hit return twice"

  students = []
  valid_months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

  puts "Name:"
  name = gets.delete("\n")

  while !name.empty? do

    puts "Country:"
    country = gets.delete("\n")
      break if country.empty?

    puts "Hobby:"
    hobby = gets.delete("\n")
      break if hobby.empty?

    puts "Height:"
    height = gets.delete("\n")
      break if height.empty?

    puts "Cohort:"
    cohort = gets.delete("\n").downcase.to_sym
      break if cohort.empty?
        while !valid_months.include?(cohort)
          puts "Please enter a calendar month"
          cohort = gets.delete("\n").downcase.to_sym
        end

    students << {name: name, country: country, hobby: hobby, height: height, cohort: cohort}

    if students.count > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end

    puts "Name:"
    name = gets.delete("\n")
      break if name.empty?
  end

  students
end

def print_header(students)
  if students.length > 0
    puts "The students of Villains Academy".center(70)
    puts "------------".center(70)
  end
end

def print_by_cohort(students)
  if students.length > 0
    cohorts = students.map do |student| student[:cohort] end
      cohorts.uniq.each do |x|
        puts "#{x.capitalize} Cohort:"
        students.each do |student|
        if student[:cohort] == x
          puts "- Name: #{student[:name]}, Country of Origin: #{student[:country]}, Hobby: #{student[:hobby]}, Height: #{student[:height]}"
        end
      end
    end
  else
    puts "There are no students enrolled at the moment."
  end
end

def print_footer(names)
  if names.length > 0
    puts "Overall, we have #{names.count} students."
  end
end

def interactive_menu
  students = []
  loop do

    puts "1. Inputs the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp

    case selection
      when "1"
        students = input_students
      when "2"
        print_header(students)
        print_by_cohort(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you mean, try again"
    end
  end
end


#students = input_students
interactive_menu
#print_header(students)
#print_by_cohort(students)
#print_footer(students)
