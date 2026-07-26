import re
print("\t\tPassword Validator")

password=input("Enter password: ")
pattern=r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"

if re.match(pattern,password):
    print("Strong password")
else:
    print("Weak password")