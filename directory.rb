def input_students
  puts "Please enter the name, country of origin, hobby and height of the students"
  puts "To finish, just hit return twice"

  students = []

  puts "Name:"
  name = gets.chomp

  while !name.empty? do

    puts "Country:"
    country = gets.chomp
      break if country.empty?

    puts "Hobby:"
    hobby = gets.chomp
      break if hobby.empty?

    puts "Height:"
    height = gets.chomp
      break if height.empty?

    puts "Cohort:"
    cohort = gets.chomp.downcase.to_sym
      break if cohort.empty?
      valid_months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
        while !valid_months.include?(cohort)
          puts "Please enter a calendar month"
          cohort = gets.chomp.downcase.to_sym
        end

    students << {name: name, country: country, hobby: hobby, height: height, cohort: cohort}
    puts "Now we have #{students.count} students"

    puts "Name:"
    name = gets.chomp
      break if name.empty?
  end

  students
end

def print_header
  puts "The students of Villains Academy".center(70)
  puts "------------".center(70)
end


def print(students)
  require 'date'
  students = students.sort_by {|x| x[:cohort] }.reverse
  students.each do |student|
    puts "#{student[:name]}, #{student[:country]}, #{student[:hobby]}, #{student[:height]} (#{student[:cohort]} cohort)".center(70)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} students."
end

students = input_students
print_header
print(students)
print_footer(students)
