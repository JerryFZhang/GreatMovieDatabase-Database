import csv

username = input()

with open('Users.csv', 'rt') as f:
     reader = csv.reader(f, delimiter=',') # good point by @paco
     for row in reader:
          for field in row:
              if field == username:
                  print "is in file"
