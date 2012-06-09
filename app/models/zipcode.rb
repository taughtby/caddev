class Zipcode < ActiveRecord::Base
  attr_accessible :city, :code, :state, :latitude, :longitude
  
  def self.distance( zip1, zip2 )
    if zip1.nil?
      puts "bad zip1"
      return 0
    end
    if zip2.nil?
      puts "bad zip2"
      return 0
    end
    if zip1.code < zip2.code
      d = Distance.find_by_row_zip_and_col_zip( zip1.code, zip2.code )
    else
      d = Distance.find_by_row_zip_and_col_zip( zip2.code, zip1.code )
    end
  
    # if we have already added to db
    if d
      return d.kms
    end
    fRkm = 6371
    nRAD_PER_DEG = 0.017453293
    
    lon1 = zip1.longitude
    lon2 = zip2.longitude
    lat1 = zip1.latitude
    lat2 = zip1.latitude
    
    # calculate
    dlon = lon2 - lon1
    dlat = lat2 - lat1
    dlon_rad = dlon * nRAD_PER_DEG
    dlat_rad = dlat * nRAD_PER_DEG
    lat1_rad = lat1 * nRAD_PER_DEG
    lon1_rad = lon1 * nRAD_PER_DEG
    lat2_rad = lat2 * nRAD_PER_DEG
    lon2_rad = lon2 * nRAD_PER_DEG
    # puts "dlon: #{dlon}, dlon_rad: #{dlon_rad}, dlat: #{dlat}, dlat_rad: #{dlat_rad}"
    a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

    dKm = fRkm * c             # delta in kilometers


    d = Distance.create( )
    if zip1.code < zip2.code
      d = Distance.create( :row_zip => zip1.code, :col_zip => zip2.code, :kms => dKm )
    else
      d = Distance.create( :row_zip => zip2.code, :col_zip => zip1.code, :kms => dKm )
    end
    return d.kms
  end
end
