from geopy.geocoders import Nominatim
import csv

geolocator = Nominatim()

location = geolocator.geocode("12 Hampton Ct.  Alameda CA")
print location

costcos = csv.reader(open('costcos-limited.csv'), delimiter=',')
header_skipped = False

for row in costcos:
    if not header_skipped:
        header_skipped = True
        
        # Print header
        print "Address,City,State,Zip Code,Latitude,Longitude"
        continue
        
    full_addy = row[1] + "," + row[2] + "," + row[3] + "," + row[4]  
#    print full_addy
    full_addy2 = row[1] + "," + row[2] + "," + row[3] 
#    print full_addy2
 
    try:
        location, (lat, lng) = geolocator.geocode(full_addy2)
        print full_addy + "," + str(lat) + "," + str(lng)
    except:
        print full_addy + ",NULL,NULL"  
