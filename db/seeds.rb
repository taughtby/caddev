# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# FAKER:
# name    = Faker::Name.name
# email   = Faker::Internet.email
# phone   = Faker::PhoneNumber.phone_number
# street  = Faker::Address.street_address
# city    = Faker::Address.city
# state   = Faker::Address.us_state_abbr
# zip     = Faker::Address.zip_code

puts "=============== CLEAN-UP =================="
puts "-------------- Clean Users ----------------"
puts "before User.destroy_all"
puts "\t #{User.count} users"
puts "\t #{Tutor.count} tutors"
puts "\t #{Student.count} students"
puts "\t #{StudyGroup.count} study groups"

User.destroy_all
puts "after User.destroy_all"
puts "\t #{User.count} users"
puts "\t #{Tutor.count} tutors"
puts "\t #{Student.count} students"
puts "\t #{StudyGroup.count} study groups"

puts "------------ Clean Subjects ----------------"
puts "before MajorSubjectArea.destroy_all"
puts "\t #{MajorSubjectArea.count} major areas"
puts "\t #{Subject.count} subjects"
MajorSubjectArea.destroy_all
puts "after MajorSubjectArea.destroy_all"
puts "\t #{MajorSubjectArea.count} major areas"
puts "\t #{Subject.count} subjects"

puts "----------- Clean StudyGroups -------------"
puts "before StudyGroup.destroy_all"
puts "\t #{StudyGroup.count} major areas"
puts "\t #{StudyGroupRegistration.count} registrations"
StudyGroup.destroy_all
puts "after StudyGroup.destroy_all"
puts "\t #{StudyGroup.count} study groups"
puts "\t #{StudyGroupRegistration.count} registrations "



puts "================ CREATE ==================="

puts "--------------- Subjects ------------------"
subjects = { 
            "Music"  => ["Guitar", "Piano","Classical guitar", "Violin", "Cello", "Drums"],
            "Sport"  => ["Football", "Baseball", "Swimming", "Chess", "Triathlon"],
            "Coding" => ["Ruby on Rails", "CSS-HTML", "C++", "Python", "Ruby", "Javascript", "PHP"]
            }
subjects.each do |k,v|
  major = MajorSubjectArea.create( :name => k.downcase )
  v.each do |sub|
    subject = Subject.create( :name => sub, :major_subject_area_id => major.id )
  end
end

puts "------- Users, tutors, and students -------"
students_per_class = [0,1,2,5,10]
all_passwords = "hockey"
# create users (which are both a tutor and a student)
50.times do |i|
  user = User.create( :name     => Faker::Name.name, 
                      :email    => Faker::Internet.email, 
                      :street   => Faker::Address.street_address,
                      :city     => Faker::Address.city,
                      :state    => Faker::Address.us_state_abbr,
                      :zip      => Faker::Address.zip_code,
                      :password =>  all_passwords 
                    )
  
  tutor = Tutor.create( :user_id => user.id )
  tutor.tutor_welcome = "lorum.."
  #10.times do |j|
  #  faq = FAQ.create( :tutor_id => tutor.id, :question => "lorum", :answer => "lorin")
  #end
  #tutor.faqs.each do |faq|
  #  faq.tutor_id
  #end
  student = Student.create( :user_id => user.id )
end


puts "------------ BEGIN Study-Groups -----------"
10.times do |i|
  # pick a tutor at random
  tutor = Tutor.order("RANDOM()").first
  
  # pick a subject at random
  subject = Subject.order("RANDOM()").first
  
  sg = StudyGroup.create( :tutor_id => tutor.id, :subject_id => subject.id )
  
  # randomly pick student for class, take first one of array
  n_students = students_per_class.sample(1)[0]
  
  # add students to class
  n_students.times do |j|
    student = Student.order("RANDOM()").first
    while student.id == tutor.id
      student = Student.order("RANDOM()").first
    end
    # create a registration for this student in this study group
    sgr = StudyGroupRegistration.create( :study_group_id => sg.id, :student_id => student.id )
  end
  
  puts "---------------- Study-Group ------------------"
  puts "study area : #{subject.name}"
  puts "tutor      : #{tutor.user.name}, #{tutor.user.street}, #{tutor.user.city}, #{tutor.user.state}, #{tutor.user.zip} "
  puts "students   :"
  if sg.students.count > 0 
    sg.students.each do |s|
      puts "           : #{s.name}"
    end
  else
    puts "           : still waiting for students..."
  end
end

stars = {0 => "terrible", 1 => "not great", 2 => "so-so", 3 => "not bad", 4 => "pretty good", 5 => "awesome"}

puts "=============== REVIEWS  =================="
Tutor.all.each do |tutor|
  if tutor.students.count > 0
    # get a tutor score between 1 and 4
    tutor_score = 1+Random.rand(5)
    
     
  end
end


puts "=============== SUMMARY  =================="
puts "after seeding"
puts "\t #{User.count} users"
puts "\t #{Tutor.count} tutors"
puts "\t #{Student.count} students"
puts "\t #{StudyGroup.count} study groups"
puts "\t #{MajorSubjectArea.count} major areas"
puts "\t #{Subject.count} subjects"
puts "=============== DONE  =================="

