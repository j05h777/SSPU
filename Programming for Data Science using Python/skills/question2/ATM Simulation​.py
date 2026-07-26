print("\t\tATM SIMULATION")

pin=123
balance=10000 #initial balance

entered_pin=int(input("Enter pin:"))

if entered_pin==pin:
    print("Pin accepted.")

    while True:
        print("\n1. Check Balance")
        print("2. Deposit")
        print("3. Withdraw")
        print("4. Exit")

        choice=int(input("\nEnter your choice: "))
        match choice:
            case 1:
                print("Your balance is: ",balance)
            case 2:
                amount=int(input("Enter amount to be deposited: "))
                balance+=amount
                print("\nAmount deposited:",amount)
                print("New balance:",balance)
            case 3:
                amount=int(input("Enter amount to be withdrawn: "))
                if amount>balance:
                    print("Insufficient balance")
                else:
                    balance-=amount
                    print("\nAmount withdrawn:",amount)
                    print("New balance:",balance)
            case 4:
                print("exiting...")
                break
else:
    print("Invalid pin")
