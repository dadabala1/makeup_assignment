import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector
from tkinter import *

def GetValue(event):
    e1.delete(0, END)
    e2.delete(0, END)
    e3.delete(0, END)
    e4.delete(0, END)
    row_id = listBox.selection()[0]
    select = listBox.set(row_id)
    e1.insert(0,select['showroom_id'])
    e2.insert(0,select['showroom_name'])
    e3.insert(0,select['location'])



def Add():
    studid = e1.get()
    studname = e2.get()
    coursename = e3.get()


    mysqldb=mysql.connector.connect(host="127.0.0.1", user="dadabala", password="123",port="3307", database="showroom")
    mycursor=mysqldb.cursor()

    try:
       sql = "INSERT INTO  showroom (showroom_id,showroom_name,location) VALUES (%s, %s, %s)"
       val = (studid,studname,coursename)
       mycursor.execute(sql, val)
       mysqldb.commit()
       lastid = mycursor.lastrowid
       messagebox.showinfo("information", "Showroom inserted successfully")
       e1.delete(0, END)
       e2.delete(0, END)
       e3.delete(0, END)
       # e4.delete(0, END)
       e1.focus_set()
    except Exception as e:
       print(e)
       mysqldb.rollback()
       mysqldb.close()


def update():
    studid = e1.get()
    studname = e2.get()
    coursename = e3.get()
    # feee = e4.get()
    mysqldb=mysql.connector.connect(host="127.0.0.1",user="dadabala",password="123",port="3307",database="showroom")
    mycursor=mysqldb.cursor()

    try:
       sql = "Update  showroom set showroom_name= %s,location= %s where showroom_id= %s"
       val = (studname,coursename,studid)
       mycursor.execute(sql, val)
       mysqldb.commit()
       lastid = mycursor.lastrowid
       messagebox.showinfo("information", "Showroom Updated successfully...")

       e1.delete(0, END)
       e2.delete(0, END)
       e3.delete(0, END)
       e4.delete(0, END)
       e1.focus_set()

    except Exception as e:

       print(e)
       mysqldb.rollback()
       mysqldb.close()

def delete():
    studid = e1.get()

    mysqldb=mysql.connector.connect(host="127.0.0.1", user="dadabala", password="123", port="3307", database="showroom")
    mycursor=mysqldb.cursor()

    try:
       sql = "delete from showroom where showroom_id = %s"
       val = (studid,)
       mycursor.execute(sql, val)
       mysqldb.commit()
       lastid = mycursor.lastrowid
       messagebox.showinfo("information", "Record Delete successfully")

       e1.delete(0, END)
       e2.delete(0, END)
       e3.delete(0, END)
       e4.delete(0, END)
       e1.focus_set()

    except Exception as e:

       print(e)
       mysqldb.rollback()
       mysqldb.close()

def show():
        mysqldb = mysql.connector.connect(host="127.0.0.1", user="dadabala", password="123",port="3307", database="showroom")
        mycursor = mysqldb.cursor()
        mycursor.execute("SELECT showroom_id,showroom_name,location FROM showroom")
        records = mycursor.fetchall()
        print(records)

        for i, (showroom_id,showroom_name,location) in enumerate(records, start=1):
              listBox.insert("", "end", values=(showroom_id,showroom_name,location))
              mysqldb.close()

root = Tk()
root.geometry("800x500")
global e1
global e2
global e3
global e4

tk.Label(root, text="Registation For Showroom", fg="red", font=(None, 30)).place(x=300, y=5)

tk.Label(root, text="Enter Showroom ID").place(x=10, y=10)
Label(root, text="Enter Showroom Name").place(x=10, y=40)
Label(root, text="Enter Location").place(x=10, y=70)


e1 = Entry(root)
e1.place(x=140, y=10)

e2 = Entry(root)
e2.place(x=140, y=40)

e3 = Entry(root)
e3.place(x=140, y=70)



Button(root, text="Add",command =Add,height=3, width= 13).place(x=30, y=130)
Button(root, text="update",command = update,height=3, width= 13).place(x=140, y=130)
Button(root, text="Delete",command =delete,height=3, width= 13).place(x=250, y=130)

cols = ('showroom_id','showroom_name','location')
listBox = ttk.Treeview(root, columns=cols, show='headings' )

for col in cols:
    listBox.heading(col, text=col)
    listBox.grid(row=1, column=0, columnspan=2)
    listBox.place(x=10, y=200)

show()
listBox.bind('<Double-Button-1>',GetValue)

root.mainloop()