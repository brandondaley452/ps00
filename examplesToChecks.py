# This script takes .rkt files and examines examples in function headers.
# It turns them into a test suite at the end of each file.

import sys
import os

def main():
    print ("PDP Test Suite Generator\n")
    choose_problem_set()
    choose_rkt_file()

def choose_problem_set():
    problem_set = "set" + input("What set is this test suite for (##)? ")
    set_dir = (os.getcwd() + "\\" + problem_set)
    if os.path.isdir(set_dir):
        os.chdir(os.getcwd() + "\\" + problem_set)

def choose_rkt_file():
    fn = input("\nWhat file (##)? ")
    #notebook = open(fn, 'a')


main()
