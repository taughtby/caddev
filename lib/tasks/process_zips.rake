task :fill_zipcodes => :environment do
  Zipcode.destroy_all

  fid = File.open( "doc/zipcodes.txt", "r")
  fid.each do |line|
      Zipcode.transaction do
        sp = line.split(",")
        zipcode   = sp[1][1..-2].to_i
        state     = sp[2][1..-2]
        city      = sp[3][1..-2]
        longitude = sp[4].to_f
        latitude  = sp[5].to_f
        Zipcode.create( :code => zipcode, :city => city, :state => state, :longitude => longitude , :latitude => latitude)
      end
  end
  fid.close()
end

task :fill_distances => :environment do
  n = 0
  Zipcode.all.each do |z1|
    #puts "zipcode #{z1.code}"
    Zipcode.where( "code > ?", z1.code).each do |z2|
      dKms = Zipcode.distance( z1, z2 )
      n += 1
    end
    if n%10000 == 0
      puts "added #{n} distances"
    end
  end
end