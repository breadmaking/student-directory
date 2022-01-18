#first we print the list of students - put into an array
students = [
  "The students of Villains Academy",
  "-------------",
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "The Terminator",
  "Freddy Kruger",
  "The Joker",
  "Joffery Baratheon",
  "Norman Bates",
]
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts students
end
#finally we print the total number of students
print "Overall, we have #{students.count} great students"