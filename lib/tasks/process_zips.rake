task :fill_zipcodes => :environment do
  Zipcode.destroy_all
  
  fid = File.open( "doc/zipcodes.txt", "r")
  
  fid.each do |line|
    # "17","60539","IL","MOOSEHEART",88.331532,41.824148,371,0.000032 
    sp = line.split(",")
    zipcode = sp[1][1..-2]
    state   = sp[2][1..-2]
    city    = sp[3][1..-2]

    Zipcode.create( :code => zipcode, :city => city, :state => state )
  end
  fid.close()
end