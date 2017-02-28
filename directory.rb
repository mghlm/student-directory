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
      if hobby.empty?
        break
      end

    puts "Height:"
    height = gets.chomp
      if height.empty?
        break
      end

    students << {name: name, country: country, hobby: hobby, height: height, cohort: :november}
    puts "Now we have #{students.count} students"

    puts "Name:"
    name = gets.chomp
      if name.empty?
        break
      end

  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  while count < students.count
    puts "#{students[count][:name]}, #{students[count][:country]}, #{students[count][:hobby]}, #{students[count][:height]} (#{students[count][:cohort]} cohort)"
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
