import os
import tkinter as tk
from tkinter import simpledialog



root = tk.Tk()
q1 = simpledialog.askstring('Path',"Complete path you want to access:")
q2 = simpledialog.askstring("Move","Move all:")
q3 = simpledialog.askstring("To","place it in:")

root = os.scandir(q1)
for i in root:
    # don't forget capitalization  
    if q2 in str(i) and i.is_file():
        print (i.path)
        os.chdir(q1)
        os.system(f" mv '{i.path}' {q3}")
