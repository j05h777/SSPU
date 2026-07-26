print("\tStudent Grade Calculator")

print("\nenter marks obtained in 5 subjects(out of 100):")
subject1=float(input("enter marks for subject 1: "))
subject2=float(input("enter marks for subject 2: "))
subject3=float(input("enter marks for subject 3: "))
subject4=float(input("enter marks for subject 4: "))
subject5=float(input("enter marks for subject 5: "))

total_marks_obtained=subject1+subject2+subject3+subject4+subject5
percentage=(total_marks_obtained/500)*100

if percentage>=90:
    grade="A+"
elif percentage>=80:
    grade="A"
elif percentage>=70:
    grade="B"
elif percentage>=60:
    grade="C"
elif percentage>=50:
    grade="D"
else:
    grade="F"

print("\nTotal marks obtained:",total_marks_obtained,"/ 500")
print("Percentage:", round(percentage, 2), "%")
print("Grade:", grade)