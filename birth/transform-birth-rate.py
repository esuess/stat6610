import csv

reader = csv.reader(open('birth-rate.csv', 'r'), delimiter=",")

rows_so_far = 0
print 'year,rate'
for row in reader:
    if rows_so_far == 0:
        header = row
        rows_so_far += 1
    else:
        
        for i in range(len(row)):
            if i > 0 and row[i]:
                print header[i] + ',' + row[i]
        
        rows_so_far += 1