import os
from pathlib import Path

user_root = input("Complete path you want to access: ")
move_from = input("Move all: ")
move_to = input("To: ")
root = os.scandir(user_root) # where the files are located

# loop through everything in that directory 
for i in root:
    # Don't forget capitalization  
    if move_from in str(i) and i.is_file():
        print (i.path)
        os.chdir(user_root)
        os.system(f" mv '{i.path}' {move_to}")
