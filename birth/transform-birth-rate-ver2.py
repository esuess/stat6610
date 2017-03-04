import csv

reader = csv.reader(open('birth-rate.csv', 'r'), delimiter=",")
writer = csv.writer(open('birth-rate-yearly5.csv', 'w'), delimiter=",")

rows_so_far = 0

data = ["year", "rate"]
writer.writerow(data)

for row in reader:
    if rows_so_far == 0:
        header = row
        rows_so_far += 1
    else:
        
        for i in range(len(row)):
            if i > 0 and row[i]:
                data = [header[i], row[i]]
                writer.writerow(data)
        
        rows_so_far += 1

