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
puts "\t #{StudyGroupPost.count} posts"
puts "\t #{StudyGroupComment.count} comments"
StudyGroup.destroy_all
puts "after StudyGroup.destroy_all"
puts "\t #{StudyGroup.count} study groups"
puts "\t #{StudyGroupRegistration.count} registrations "
puts "\t #{StudyGroupPost.count} posts"
puts "\t #{StudyGroupComment.count} comments"




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
  nm = Faker::Name.name
  while User.find_by_name( nm )
    nm = Faker::Name.name
  end
  user = User.create( :name     => nm, 
                      :email    => Faker::Internet.email, 
                      :street   => Faker::Address.street_address,
                      :city     => Faker::Address.city,
                      :state    => Faker::Address.us_state_abbr,
                      :zip      => Faker::Address.zip_code,
                      :password =>  all_passwords 
                    )
  
  tutor = Tutor.create( :user_id => user.id )
  tutor.tutor_welcome = "Donec in enim ante, id tempor justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse facilisis pellentesque varius. Praesent rutrum, elit sit amet suscipit fermentum, lacus libero commodo massa, nec fringilla purus diam eget metus. Mauris quam lacus, ultrices eget bibendum eget, scelerisque id odio.
  Nulla facilisi. Quisque dolor lacus, lobortis a scelerisque sit amet, fringilla et diam. Aliquam malesuada ligula sed quam gravida et volutpat sapien posuere. Duis egestas lobortis velit, eu feugiat leo tempor vel. In hac habitasse platea dictumst. Nam lacus lectus, tempor at elementum nec, vehicula eget neque. Aliquam in odio nulla."
  10.times do |j|
    faq = FAQ.create( :tutor_id => tutor.id, 
                      :question => "lorum", 
                      :answer => "lorin")
  end
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
  sg.student_limit = 1+Random.rand(10)
  sg.cost_per_hour = 1+Random.rand(50)
  sg.syllabus = "The syllabus..."
  sg.save
  
  # randomly pick student for class, take first one of array
  n_students = Random.rand(sg.student_limit)
  
  # add students to class
  n_students.times do |j|
    student = Student.order("RANDOM()").first
    while student.id == tutor.id && StudyGroupRegistration.find_by_student_id( student.id)
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

stars = {
  0 => "This guy is terrible. Avoid at all cost!", 
  1 => "I have to say, this tutor isn't great.", 
  2 => "This tutor was so-so, lots of improvement needed.", 
  3 => "Pretty good, this fellow.", 
  4 => "This guy is darn good.", 
  5 => "I can't say enough about this guy, he is awesome!"}

puts "=============== REVIEWS  =================="
Tutor.all.each do |tutor|
  if tutor.students.count > 0
    # get a tutor score between 1 and 4
    tutor_score = 1+Random.rand(5)
    
    tutor.students.each do |student|
      if Random.rand() < 0.5
        review = TutorReview.create( :tutor_id => tutor.id, :student_id => student.id, :stars => tutor_score, :review_text => stars[tutor_score])
        if tutor_score == 0
          review_reply = TutorReviewReply.create( :tutor_review_id => review.id, :tutor_id => tutor.id, :explanation_text => "Well, this student was equally bad!")
        elsif tutor_score == 5
          review_reply = TutorReviewReply.create( :tutor_review_id => review.id, :tutor_id => tutor.id, :explanation_text => "Cheers! It was a pleasure teaching you.")
        end
      end
    end 
  end
end

puts "========== StudyGroup Posts  =============="
StudyGroup.all.each do |sg|
  if sg.students.count > 0
    StudyGroupPost.create( :body=>"Welcome to the class.  Check out the syllabus to see what to expect", 
                           :study_group_id => sg.id, :title => "Welcome", :user_id => sg.tutor.user.id )
                           
    10.times do |post_id|
      # most posts by tutor (75%)
      if Random.rand() < 0.75
        sgp = StudyGroupPost.create( :body=>"New material for this week.", 
                               :study_group_id => sg.id, :title => "Guys, check out the new stuff.", :user_id => sg.tutor.user.id )
      
        if Random.rand() < 0.5
          # body, :comment_id, :study_group_post_id, :user_id
          cmt = StudyGroupComment.create( :user_id => sg.tutor.user.id, :study_group_post_id => sgp.id, :comment_id => nil, :body => "Whoops, forgot to mention this bit...")
        else
          cmt = StudyGroupComment.create( :user_id => sg.students.order("RANDOM()").first.user.id, :study_group_post_id => sgp.id, :comment_id => nil, :body => "Looking forward to it!")
        end
      else
        poster = sg.students.order("RANDOM()").first
        sgp = StudyGroupPost.create( :body=>"I'm having trouble with this week's material, anybody else?", 
                               :study_group_id => sg.id, :title => "Having trouble", :user_id => poster.user.id )
                               
        
        if Random.rand() < 0.5
          # body, :comment_id, :study_group_post_id, :user_id
          cmt = StudyGroupComment.create( :user_id => sg.tutor.user.id, :study_group_post_id => sgp.id, :comment_id => nil, :body => "We'll spend more time on this next class.  In the meantime, here is some info.")
        else
          cmt = StudyGroupComment.create( :user_id => sg.students.order("RANDOM()").first.user.id, :study_group_post_id => sgp.id, :comment_id => nil, :body => "Yeah, I did.  Hope we go over that in class.")
        end
        
      end
    end
  end
end

puts "=============== SUMMARY  =================="
puts "after seeding"
puts "\t #{MajorSubjectArea.count} major areas"
puts "\t #{Subject.count} subjects"
puts "\t #{User.count} users"
puts "\t #{Tutor.count} tutors"
puts "\t #{Student.count} students"
puts "\t #{StudyGroup.count} study groups"
puts "\t #{StudyGroupPost.count} posts"
puts "\t #{StudyGroupComment.count} comments"
puts "=============== DONE  =================="