# we put students in an array
students = [
"The students of Villains Academy",
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]
# then print them
puts "The students of Villains Academy"
puts "----------"
students.each { |student| puts student }
# then we print the total number of students.
print "Overall, we have #{students.count} great students."
