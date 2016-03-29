import csv
from collections import namedtuple
from StringIO import StringIO
def read_csv(file, columns, type_name="Row"):
   try:
     row_type = namedtuple(type_name, columns)
   except ValueError:
     row_type = tuple
   rows = iter(csv.reader(file))
   header = rows.next()
   mapping = [header.index(x) for x in columns]
   for row in rows:
     row = row_type(*[row[i] for i in mapping])
     yield row

testdata = open('user.csv', 'rb')

testfile = StringIO(testdata)
for row in read_csv(testfile, 'UserId,Password,Last_name,First_name,Email,Year_born,Gender'.split()):
    print row

# Row(AAA='1', GGG='20', DDD='4')
# Row(AAA='2', GGG='23', DDD='5')
# Row(AAA='4', GGG='22', DDD='6')
# Row(AAA='2', GGG='23', DDD='5')
# Row(AAA='2', GGG='23', DDD='5')
