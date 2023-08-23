import os
from pathlib import Path

root = os.scandir("/your/path/Desktop")

for i in root:
    if i.is_file():
        ex = os.path.splitext(i)
        os.chdir('/your/path/Desktop')
        flo = (ex[1]+'s')
        flo = flo.removeprefix('.')
        #print (flo)
        if not (Path(flo).is_dir()):
            print ('Creaking')
            dir = os.mkdir(flo)
            os.system(f'mkdir {dir} | mv "{i.path}" {dir}')
        else:
            print ("success")
            os.system(f"mv '{i.name}' {flo}")

