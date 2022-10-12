from tkinter import *
from tkinter import messagebox, Entry
import pickle


root = Tk()
root.geometry("800x800")
root.title("Войти в систему")

def registration():
    text = Label (text = "Для входа в систему - зарегистрируйтесь:")
    text_log = Label(text = "Введите Ваш Логин: ")
    registr_login  = Entry()
    text_password = Label(text = 'Введите ваш пароль: ')
    registr_password = Entry(show='*')
    button_registr = Button(text = "зарегаца", command=lambda : save())
    text.pack()
    text_log.pack()
    registr_login.pack()
    text_password.pack()
    registr_password.pack()
    button_registr.pack()
    def save ():
        login_pass_save = {}
        try:
            f = open("login.txt", "rb")
            login_pass_save = pickle.load(f)
            f.close()
        except Exception:
            pass
        login_pass_save[registr_login.get()] = registr_password.get()
        f = open("login.txt", 'wb')
        pickle.dump(login_pass_save, f)
        f.close()
        login()
def login():
    text_log = Label(text = 'Hello, u in BOYYYY')
    tex_enter_log = Label(text = 'LOGIN AGAIN ')
    enter_log = Entry()
    text_enter_pass = Label(text = 'PASSWORD AGAIN')
    enter_password = Entry(show = '*')
    button_enter = Button(text = 'GO IN', command=lambda : (log_pass()))
    text_log.pack()
    tex_enter_log.pack()
    enter_log.pack()
    text_enter_pass.pack()
    enter_password.pack()
    button_enter.pack()

    def log_pass ():
        f = open('login.txt', 'rb')
        a =pickle.load(f)
        f.close()
        if enter_log.get() in a:
            if enter_password.get() == a[enter_log.get()]:
                messagebox.showinfo('hello!',' u have new messages!')
            else:
                messagebox.showerror('error!', 'something wrong')
        else:
            messagebox.showerror('error','pityh')






registration()
root.mainloop()
