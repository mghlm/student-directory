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

    students << {name: name, country: country, hobby: hobby, height: height, cohort: :november}
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
  count = 0
  while count < students.count
    puts "#{students[count][:name]}, #{students[count][:country]}, #{students[count][:hobby]}, #{students[count][:height]} (#{students[count][:cohort]} cohort)".center(70)
    count += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} students."
end

students = input_students
print_header
print(students)
print_footer(students)
