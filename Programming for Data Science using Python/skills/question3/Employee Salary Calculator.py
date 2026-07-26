print("\t\tEmployee Salary Calculator")   

basic_salary=int(input("\nEnter basic salary: "))
#allowances
hra=basic_salary*.2 #House Rent Allowance
da=basic_salary*.1  #Dearness Allowance
ta=basic_salary*.05 #Travel Allowance

gross_salary=basic_salary+hra+da+ta

#deductions
#provident fund
pf=basic_salary*.12

#tax
if gross_salary <= 300000:
    tax = 0
elif gross_salary <= 600000:
    tax = gross_salary * 0.05
elif gross_salary <= 1000000:
    tax = gross_salary * 0.10
else:
    tax = gross_salary * 0.20

net_salary=gross_salary-pf-tax

print(f"\n\t\tSalary Details")
print(f"Basic Salary : ₹{basic_salary}")
print(f"HRA          : ₹{hra}")
print(f"DA           : ₹{da}")
print(f"TA           : ₹{ta}")
print(f"Gross Salary : ₹{gross_salary}")
print(f"PF           : ₹{pf}")
print(f"Tax          : ₹{tax}")
print(f"Net Salary   : ₹{net_salary}")