def add(a, b):
    return a + b

def subtract(a,b):
    return a-b

def multiply(a,b):
    return a*b

def divide(a,b):
    return a/b

print("\t\tSimple Calculator")

a=float(input("\nEnter First Number: "))
b=float(input("Enter Second Number: "))

while True:
    print("\n1. Addition")
    print("2. Subtraction")
    print("3. Multiplication")
    print("4. Division")
    print("5. Exit")

    choice=int(input("\nEnter choice:"))
    match choice:
        case 1:
            result=add(a,b)
            print("result:",result)
        case 2:
            result=subtract(a,b)
            print("result:",result)
        case 3:
            result=multiply(a,b)
            print("result:",result)
        case 4:
            if b==0:
                print("Cannot divide by zero")
            else:
                result=divide(a,b)
                print("result:",result)     
        case 5:
            print("exiting...")
            break
        case _:
            print("Invalid choice")




    