import sys
import time
import os

spacing = " | "

def main():
    print ("PDP Notebook Generator\n")
    problem_set = "set" + input("What set is this notebook for (##)?: ")
    set_dir = (os.getcwd() + "\\" + problem_set)
    if not os.path.isdir(set_dir):
         os.mkdir(set_dir, 755)
    os.chdir(os.getcwd() + "\\" + problem_set)
    if os.path.isfile("notebook.txt"):
        print ("\nNOTEBOOK.TXT EXISTS")
    else:
        print ("\nnotebook.txt does not exist.")
    new_or_add = input("\n  n -- create new notebook or overwrite existing\n" + "  a -- add to existing notebook\n" + "  q -- quit\n\n")

    if new_or_add == "n":
        if os.path.isfile("notebook.txt"):
            overwrite = input("Overwrite current notebook.txt, y or n? ")
            if overwrite == "n":
                sys.exit("\nClosing notebook script...")
        notebook = open("notebook.txt", 'a')
        createNewNotebook(notebook, problem_set)
        addyn = input("\nNew work entry, y/n? ")
        if addyn == "y":
            addNewEntry(notebook)
    if new_or_add == "a":
        notebook = open("notebook.txt", 'a')
        addNewEntry(notebook)
    else:
        sys.exit("\nClosing notebook script...")

def createNewNotebook(notebook, problem_set):
    notebook.write("Brandon Daley\n")
    notebook.write("CS 5010\n")
    notebook.write("Programming Design Paradigm\n")
    notebook.write("Fall 2014 Semester\n")
    notebook.write("Dr. Stephen Chang\n\n")
    notebook.write(problem_set + " Notebook\n")
    notebook.write("========================================================================================================\n")
    notebook.write("  DATE |    WHO   | START | STOP |  INTERRUPTS  | QUESTION | ToT | COMMENTS\n")
    notebook.write("--------------------------------------------------------------------------------------------------------\n")

def addNewEntry(notebook):
    # get day I started working, in case I end after midnight
    start_date = time.strftime("%d") + " " + time.strftime("%b")
    start_time = time.strftime("%H") + time.strftime("%M")
    while True:
        question = input("\nHit y when done working: ")
        if len(question) > 0:
            answer = question.lower()
            if answer == "y":
                break
    notebook.write(start_date + spacing)
    addPartners(notebook)
    notebook.write(start_time)
    notebook.write(" " + spacing)
    stop_time = time.strftime("%H") + time.strftime("%M")
    notebook.write(stop_time)
    notebook.write(spacing)
    notebook.write("    ")
    interrupt_time = input("\nInterrupt time (##): ")
    if not is_number(interrupt_time):
        interrupt_time = "NA"
    if len(interrupt_time) < 2:
        interrupt_time = "0" + interrupt_time
    notebook.write(interrupt_time)
    notebook.write("      " + spacing)
    addQuestions(notebook)
    time_diff = ((int(int(stop_time)/100)*60) + (int(stop_time)%100)) - ((int(int(start_time)/100)*60) + (int(start_time)%100))
    if (interrupt_time != "na") and (interrupt_time != "NA"):
        time_diff -= int(interrupt_time)
    notebook.write(str(time_diff) + (" " * (3 - len(str(time_diff)))) + spacing)
    notebook.write(input("\nComments: ") + "\n")
    commit(notebook)
    
def addPartners(notebook):
    notebook.write("Me")
    str_len = 2
    partner = input("\nPartner initials (XX): ")
    if len(partner) >= 2:
        notebook.write(", " + partner)
        str_len += len(", " + partner)
    notebook.write(" " * (8 - str_len))
    notebook.write(spacing)

def addQuestions(notebook):
    question_range = input("\nQuestion range, ##-##: ")
    notebook.write(question_range)
    notebook.write(" " * (8 - len(question_range)))
    notebook.write(spacing)

def commit(notebook):
    commit_answer = input("\nAre you committing to GitHub, y or n?: ")
    if commit_answer == "y":
        notebook.write("============committing to git: "
                       + time.strftime("%d") + " " + time.strftime("%b") + " "
                       + time.strftime("%H") + time.strftime("%M")
                       + "===================\n")

def is_number(s):
    try:
        int(s)
        return True
    except ValueError:
        return False

main()
