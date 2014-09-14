with open('somefile') as openfileobject:
    for line in openfileobject:
        do_something()


def determineDesignStrategy():
    strategy_list = ["1--Function Composition\n",
                     "2--Cases\n",
                     "3--Parts\n",
                     "4--Structural Decomposition\n",
                     "5--Generalization\n",
                     "6--General Recursion\n",
                     "7--Communication via State\n"]
    print (strategy_list[0] +
           strategy_list[1] +
           strategy_list[2] +
           strategy_list[3] +
           strategy_list[4] +
           strategy_list[5] +
           strategy_list[6])
    strategy = input("Select # for design strategy, then press Enter: ")
    # now I need to determine what was selected
    # write to file "Design Strategy: (strategy_list[strategy])[3:]"
