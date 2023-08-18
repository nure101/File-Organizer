import os
from pathlib import Path

root = (os.scandir('/Your/dir/path'))

for i in root:
    if 'Screenshot' in str(i):
        #print (i.name)
        if i.is_file():
            os.chdir('/Your/dir/path')
            os.system(f" mv '{i.path}' screenshots")

        #os.scandir('/Users/nuremo/Desktop')

        #os.system(f'mv {i.path} test_files')
#os.system('ls')
