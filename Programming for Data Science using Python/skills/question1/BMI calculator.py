print("\t\tBMI Calculator")

weight=float(input("Enter your weight in kg: "))
height=float(input("Enter your height in meters: "))

bmi=(weight/(height)**2)

if bmi<18.5:
    print("\nYour BMI is: ",round(bmi,2),"\nYou are underweight")
elif bmi>=18.5 and bmi<24.9:
    print("\nYour BMI is: ",round(bmi,2),"\nYou are normal weight")
elif bmi>=25 and bmi<29.9:
    print("\nYour BMI is: ",round(bmi,2),"\nYou are overweight")
else:
    print("\nYour BMI is: ",round(bmi,2),"\nYou are obese")