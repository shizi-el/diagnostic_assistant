from tkinter import *
from tkinter import ttk
from pyswip import Prolog


swipl = Prolog()


#Database
db = {
                "paludisme": ["la fievre froide","la cephalees","les vertiges","des coubatures"],
                "covid_19": ["des maux de tete","des douleurs musculaires","mal a gorge","des nausees vomissements","une fievre froide","une hemoragie"],
                "tuberculose": ["des douleurs toraciques","de dysphne","des hemoptysie","le nez qui coule","une toux seche"],
                "typhoide": ["la fievre froide","des cephalees","des vertiges","des courbatures"],
                "syphillis": ["des chancre","des maux de tete","des douleurs musculaires","la fievre froide","les macul rouges"],
                "ebola": ["maux de tete","douleurs musculaires","mal de gorge","nausees vomissements","de fievre froide","des hemoragies"]
    }

# Write in prolog file
def file_writer():
    file = open('engine.pl',"w")
    for maladie in db:
        for symptom in db[maladie]:
            file.write("symptom("+maladie+","+"'"+symptom+"'"+").\n")
    file.close()
file_writer()

click_nber = 0


def check_symptoms():
    global click_nber
    for maladie in db:
        question = Label(frame,text="Avez vous de"+db[maladie][click_nber]+" ?", font=('Courrier',12), bg='#41B77F',fg='white')
        question.pack()
        if click_nber <= len(db[maladie]):
            break;
    if click_nber == len(db[maladie])-1:
        click_nber = 0
       
    click_nber +=1
    

#Interact with swipl
def set_assertions():


#def on_no():


main_window = Tk()

main_window.title("Diagnostic medical assistant")
main_window.geometry('720x480')
main_window.minsize(480,360)

main_window.config(background='#41B77F')

frame = Frame(main_window, bg='#41B77F')

# Text de bienvenue
welcome = Label(frame, text="Bonjour, et bienvenue à la clinique AIA 3 !",font=('Courrier',30), bg='#41B77F',fg='white')
welcome.pack()
assistant = Label(frame,text="Je m'appelle Doctor_AIA 3, je suis un agent assistant au diagnotic des maladies, je vais vous aider à découvrir de quoi vous souffrez.", font=('Courrier',12), bg='#41B77F',fg='white')
assistant.pack()
help = Label(frame, text="Veuillez répondre par oui ou par non aux questions qui vous seront posées, en cliquant sur le button correspondant.",font=('Courrier',10), bg='#41B77F',fg='white')
help.pack()

#questions
def on_yes():
    check_symptoms()




#Les buttons
yesBtn= Button(frame,text="OUI", font=('Courrier',10), bg='white',fg='#41B77F', command=on_yes)
yesBtn.pack(padx=10,pady=10, fill=X)
noBtn = Button(frame, text="NON", font=('Courrier',10), bg='white',fg='#41B77F', command=on_no)
noBtn.pack(padx=10,pady=10, fill=X)



#Une boite
frame.pack(expand=YES)

# Boucle principale
main_window.mainloop()




def file_writer():
    file = open('engine.pl',"w")

#
    for maladie in db:
        for symptom in db[maladie]:
            file.write("symptom("+maladie+","+"'"+symptom+"'"+").\n")
    file.close()

