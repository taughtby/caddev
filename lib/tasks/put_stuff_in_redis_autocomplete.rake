# using redis
#
# 1) start redis
#    $ redis-server
#
# 2) load data into redis
#    rake generate_soulmate
#    soulmate load subject --redis=redis://localhost:6379/0 < db/subjects.json
#    soulmate load place   --redis=redis://localhost:6379/0 < db/places.json
#
# 3) verify in localhost (start redis (1) )
#    http://localhost:3000/sm/search?types[]=subject&term=gui
#
#    gives:
#    {"term":"gui","results":{"subject":[
#        {"id":"417","term":"Classical guitar","score":1},
#        {"id":"415","term":"Guitar","score":1}]}}
#
# 4) verify below works
#  
# 5) inspect elements on search page to see if results are there
#

task :create_subjects_json => :environment do
  fid = File.new( "db/subjects.json", "w+")
  
  @subjects = Subject.find(:all)
  @subjects.each do |sub|
    
    fid.write( "{\"id\":\"#{sub.id}\",\"term\":\"#{sub.name}\",\"score\":1}\n")
  end
  fid.close()
end

task :create_place_json => :create_subjects_json do
  # same but for city, state?
end

task :generate_soulmate => :create_subjects_json do
  
end