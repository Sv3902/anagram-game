from random import choice, sample
from tkinter import *
from tkinter import ttk

# ------- Чтение файла со словами --------------------------
with open("word_list.txt", encoding="utf-8") as file:
    array = [row.strip() for row in file]


# ------- Преобразование сломанных слов --------------------
def anagram_word():
    word = choice(array)
    word_mix = sample(word, k=len(word))
    return ''.join(word_mix)


# ------- Получение нового сломанного слова ----------------
def new_word():
    word = choice(array)
    word_mix = sample(word, k=len(word))
    hidden_words = ''.join(word_mix)
    return entry_mass.set(hidden_words)


# ------- Проверка введенного слова пользователя -----------
def get_answer():
    ent = answ.get()
    if ent in array:
        label_answer = ttk.Label(text="Вы угадали!")
        label_answer.pack(anchor=NW, padx=10, pady=10)
    else:
        label_answer = ttk.Label(text="Вы не угадали! Попробуйте еще раз!!")
        label_answer.pack(anchor=NW, padx=10, pady=10)


# ------- Создание окна ------------------------------------
root = Tk()
root.title("Игра 'Анаграмма'")
root.geometry("400x250")
# ----------------------------------------------------------

# ------- Создание задизейбленного поля загаданных слов ----
label_word = ttk.Label(text="Загаданное слово:")
label_word.pack(anchor=NW, padx=10, pady=10)

entry_mass = StringVar(root, anagram_word())
entry_hidden_word = ttk.Entry(root, state='disabled', textvariable=entry_mass)
entry_hidden_word.place(x=120, y=10)
# ----------------------------------------------------------

# ------- Создание поля с ответами пользователя ------------
label_word = ttk.Label(text="Ваш ответ: ")
label_word.pack(anchor=NW, padx=10, pady=10)

answ = StringVar()
entry_answer = ttk.Entry(root, textvariable=answ)
entry_answer.place(x=80, y=50)
entry_answer.focus()
# ----------------------------------------------------------

# ------- Создание кнопок ----------------------------------
btn = ttk.Button(text="Проверить", command=get_answer)
btn.pack(anchor=NW, padx=10, pady=10)

btn_new_word = ttk.Button(text="Новое слово", command=new_word)
btn_new_word.place(x=140, y=88)
# ----------------------------------------------------------

root.mainloop()
