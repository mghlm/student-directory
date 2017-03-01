def input_students
  puts "Please enter the name, country of origin, hobby and height of the students"
  puts "To finish, just hit return twice"

  students = []
  valid_months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

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
        while !valid_months.include?(cohort)
          puts "Please enter a calendar month"
          cohort = gets.chomp.downcase.to_sym
        end

    students << {name: name, country: country, hobby: hobby, height: height, cohort: cohort}

    if students.count > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end

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

def print_by_cohort(students)
  cohorts = students.map do |student| student[:cohort] end
    cohorts.uniq.each do |x|
      puts "#{x} cohort:"
      students.each do |student|
      if student[:cohort] == x
        puts "#{student[:name]}"
      end
    end
  end
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} students."
  else
    puts "Overall, we have #{names.count} student."
  end 
end

students = input_students
print_header
print_by_cohort(students)
print_footer(students)
