import csv,os,xlrd

file_names = ['User','Country','Movie','Language','Topic','Director','Directs']

def csv_from_excel():
    wb = xlrd.open_workbook('project-data.xls')
    for item in file_names:
        print item
        file_names_str = str(item)
        sh = wb.sheet_by_name(file_names_str)
        current_csv = open(file_names_str+'.csv', 'wb')
        wr = csv.writer(current_csv)

        for rownum in xrange(sh.nrows):
            wr.writerow(sh.row_values(rownum))

        current_csv.close()

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
        # for field in row:
        #     if isinstance(field, str):
        #         print field + 'is string'
        #     else:
        #         print field + 'is not string'
        #     for item in field:
        #         print item
        output_file.write( 'INSERT INTO  %s \nVALUES (%s);\n' %(item_name,row[0]))
    print'File %s.sql is populated.' % item_name

csv_from_excel()
print 'exported data'
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
