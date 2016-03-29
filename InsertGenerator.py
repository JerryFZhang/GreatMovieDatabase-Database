import csv,os

file_names = ['user','country','movie','language','topic','director','directs']

def RepresentsInt(s):
    try:
        int(s)
        return True
    except ValueError:
        return False

def populate():
    # File should be first emptied before inserting sql code.
    open(item_name+'.sql', 'w').close()
    print'File %s.sql is empty.' % item_name

    output_file = open(item_name + '.sql', 'w')
    next(input_file)
    reader = csv.reader(input_file, delimiter=' ')
    for row in reader:
        output_file.write( 'INSERT INTO  %s \nVALUES (%s);\n' %(item_name,row[0]))
    print'File %s.sql is populated.' % item_name

for item in file_names:
    item_name = str(item)
    with open(item_name + '.csv', 'rb') as input_file:
        if not os.path.isfile(item_name + '.sql'):
            populate()
        else:
            if not os.stat(item_name+'.sql').st_size == 0:
                input = (raw_input('There is some data in %s.sql, are you sure to delete your existing data in %s.sql? (y/n)' % (item_name,item_name)))
                if not input =='y' and not input == 'Y':
                    print 'Program teminated, user refuse to delete data in %s.sql' % item_name
                    break
                else:
                    populate()
            else:
                populate()
